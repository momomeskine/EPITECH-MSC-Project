defmodule TimeManagerAPI.Auth.Authentification do
  alias TimeManagerAPI.Auth.Authorization

  def init(default), do: default

  def call(conn, _default) do
    case Authorization.extract_token(conn) do
      {:ok, token} ->
        case TimeManagerAPI.Token.verify_and_validate(token) do
          {:ok, claims} ->
            case Authorization.verify_token(claims) do
              {:ok} -> Authorization.authorized(conn, token)
              {:error} -> Authorization.unauthorized(conn)
            end

          {:error, _default} ->
            Authorization.unauthorized(conn)
        end

      _ ->
        Authorization.unauthorized(conn)
    end
  end
end
