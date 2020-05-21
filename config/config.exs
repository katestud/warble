# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :warble,
  ecto_repos: [Warble.Repo]

# Configures the endpoint
config :warble, WarbleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Gw+TVTPezXfH/vO4tpfSRk0ufipVN1U6jzRFDyPTZceYfv7GLluP/kuYC3/5jkim",
  render_errors: [view: WarbleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Warble.PubSub,
  live_view: [signing_salt: "E9xaH9FU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
