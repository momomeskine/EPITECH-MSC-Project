defmodule TimeManagerAPIWeb.UserController do
  use TimeManagerAPIWeb, :controller

  alias TimeManagerAPI.Accounts
  alias TimeManagerAPI.Accounts.User
  alias TimeManagerAPIWeb.Auth.Guardian

  action_fallback TimeManagerAPIWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
    {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("user.json", %{user: user, token: token})
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
      emailSearch != "" && usernameSearch != "" -> render(conn, "show.json", user: Accounts.search_user!(usernameSearch, emailSearch))
      true -> render(conn, "index.json", users: Accounts.list_users())
    end
  end

  def update(conn, %{"userID" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

def signin(conn, %{"email" => email, "password" => password}) do
  with {:ok, user, token} <- Guardian.authenticate(email, password) do
    conn
    |> put_status(:created)
    |> render("user.json", %{user: user, token: token})
  end
end

  def delete(conn, %{"userID" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
