# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kingfisher,
  ecto_repos: [Kingfisher.Repo]

# Configures the endpoint
config :kingfisher, KingfisherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5HvRXWaV9CYxIJMCcEmvHDGMilm4i+u/4GUQ8xTs/nd0MrPlzkI74tMbnqhKguV2",
  render_errors: [view: KingfisherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kingfisher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :ueberauth, Ueberauth,
  providers: [
    github:   {Ueberauth.Strategy.Github, []},
    facebook: {Ueberauth.Strategy.Facebook, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
 client_id: System.get_env("FACEBOOK_CLIENT_ID"),
 client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
