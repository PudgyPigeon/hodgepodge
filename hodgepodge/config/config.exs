import Config

config :hodgepodge, ecto_repos: [Hodgepodge.Repo]

config :hodgepodge, Hodgepodge.Repo,
  database: System.get_env("PG_DB") || "dev",
  username: System.get_env("PG_USER") || "postgres",
  password: System.get_env("PG_PASSWORD") || "",
  hostname: System.get_env("PG_HOST") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: System.get_env("PG_POOL_SIZE") || 1
