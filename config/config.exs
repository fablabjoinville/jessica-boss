# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jessica_boss,
  ecto_repos: [JessicaBoss.Repo],
  heroku_url: 'https://change-it-later.heroku-app.com'

# Configures the endpoint
config :jessica_boss, JessicaBossWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WLrpw7VpabPaMrwR0q3SvmQL78kIuarX9Eb/Q4MqdIgbKmAywrEcYa87aIZ8ZqOe",
  render_errors: [view: JessicaBossWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: JessicaBoss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
