defmodule TimeManagerAPI.Repo do
  use Ecto.Repo,
    otp_app: :timeManagerAPI,
    adapter: Ecto.Adapters.Postgres
end
