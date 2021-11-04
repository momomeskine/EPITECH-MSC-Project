defmodule TimeManagerAPI.Auth.Authorization do
  def extract_role(conn) do
    case extract_token(conn) do
      {:ok, token} ->
        case TimeManagerAPI.Token.verify_and_validate(token) do
          {:ok, claims} -> claims["role"]
        end
    end
  end

  def extract_userid(conn) do
    case extract_token(conn) do
      {:ok, token} ->
        case TimeManagerAPI.Token.verify_and_validate(token) do
          {:ok, claims} -> claims["user_id"]
        end
    end
  end

  def extract_token(conn) do
    case Plug.Conn.get_req_header(conn, "bearer") do
      [auth_header] -> {:ok, auth_header}
      _ -> {:error, :missing_auth_header}
    end
  end

  def verify_token(claims) do
    {:ok, expiry} = NaiveDateTime.from_iso8601(claims["expiry"])

    if NaiveDateTime.compare(expiry, DateTime.utc_now()) == :gt do
      {:ok}
    else
      {:error}
    end
  end

  def verify_admin(claims) do
    role = claims["role"]

    if role == "admin" do
      {:ok}
    else
      {:error}
    end
  end

  def verify_manager(claims) do
    role = claims["role"]

    if role == "manager" || role == "admin" || role == "general manager" do
      {:ok}
    else
      {:error}
    end
  end

  def verify_generalmanager(claims) do
    role = claims["role"]

    if role == "general manager" || role == "admin" do
      {:ok}
    else
      {:error}
    end
  end

  def unauthorized(conn) do
    conn |> Plug.Conn.send_resp(401, "Unauthorized") |> Plug.Conn.halt()
  end

  def authorized(conn, user) do
    conn
    |> Plug.Conn.assign(:signed_in, true)
    |> Plug.Conn.assign(:signed_user, user)
  end
end
