defmodule TimeManagerAPI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TimeManagerAPI.Repo,
      # Start the Telemetry supervisor
      TimeManagerAPIWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TimeManagerAPI.PubSub},
      # Start the Endpoint (http/https)
      TimeManagerAPIWeb.Endpoint
      # Start a worker by calling: TimeManagerAPI.Worker.start_link(arg)
      # {TimeManagerAPI.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TimeManagerAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TimeManagerAPIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
