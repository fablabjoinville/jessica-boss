use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jessica_boss, JessicaBossWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :jessica_boss, JessicaBoss.Repo,
  adapter: Sqlite.Ecto2,
  database: "jessica_boss_dev.sqlite3",
  pool: Ecto.Adapters.SQL.Sandbox

