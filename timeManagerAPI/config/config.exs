# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :timeManagerAPI,
  ecto_repos: [TimeManagerAPI.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :timeManagerAPI, TimeManagerAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2PDrc/2l0pBhtcyg9rJ2SKVrV+ImLDK5K/oxY5wVclx2pA1b9Q/PKA71dnba5smq",
  render_errors: [view: TimeManagerAPIWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TimeManagerAPI.PubSub,
  live_view: [signing_salt: "BMiDzW5+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
