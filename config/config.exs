# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tryexpug,
  ecto_repos: [Tryexpug.Repo]

# Configures the endpoint
config :tryexpug, Tryexpug.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2tg8ZVq2qSkXISLnewU4IF1eUUUD2L2J81/Bpv5M2N9UTqg73n+Xs95gGlrohaif",
  render_errors: [view: Tryexpug.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tryexpug.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
