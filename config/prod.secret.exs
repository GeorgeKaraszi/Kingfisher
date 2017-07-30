use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :kingfisher, KingfisherWeb.Endpoint,
  secret_key_base: System.get_env("APPLICATION_SECRET_BASE") #"Dfu4NTFdfylJvLcuq2q/j8m05Tr0J8qYzym8k0F3Z/uB2zczLI4UZ3lzAuq4cB4i"

# Configure your database
config :kingfisher, Kingfisher.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
