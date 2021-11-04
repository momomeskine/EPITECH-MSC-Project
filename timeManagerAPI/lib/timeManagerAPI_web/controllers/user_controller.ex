defmodule TimeManagerAPIWeb.UserController do
  use TimeManagerAPIWeb, :controller

  alias TimeManagerAPI.Accounts
  alias TimeManagerAPI.Accounts.User
  alias TimeManagerAPI.Token

  action_fallback TimeManagerAPIWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"userID" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def search(conn, params) do
    emailSearch = Map.get(params, "email", "")
    usernameSearch = Map.get(params, "username", "")

    cond do
      emailSearch != "" && usernameSearch != "" ->
        render(conn, "show.json", user: Accounts.search_user!(usernameSearch, emailSearch))

      true ->
        render(conn, "index.json", users: Accounts.list_users())
    end
  end

  def update(conn, %{"userID" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    case sign_in(email, password) do
      {:ok, token} ->
        conn
        |> put_status(:ok)
        |> send_resp(200, token)

      {:error, reason} ->
        conn
        |> send_resp(401, reason)
    end
  end

  def logout(conn, _params) do
    put_req_header(conn, "Bearer", "")
    send_resp(conn, :no_content, "")
  end

  def sign_in(email, password) do
    case Comeonin.Bcrypt.check_pass(Accounts.get_by_email(email), password) do
      {:ok, user} ->
        expiry = DateTime.add(DateTime.utc_now(), 3600 * 24, :second)
        csrf = get_csrf_token()
        {:ok, token, _claims} =
          Token.generate_and_sign(%{
            "users_id" => user.id,
            "role" => user.role,
            "csrf-token" => csrf,
            "expiry" => expiry
          })

        {:ok, token}

      err ->
        err
    end
  end

  def promotion(conn, %{"userID" => userID}) do
    user = Accounts.get_user!(userID)

    with {:ok, %User{} = user} <- Accounts.promotion_user(user) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"userID" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
