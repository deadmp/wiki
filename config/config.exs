# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wiki,
  ecto_repos: [Wiki.Repo]

# Configures the endpoint
config :wiki, Wiki.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xTmwdR5eXT8XgkURVQEL7ihFXXmQIQtbpBEk81+K35XJgWMSYvBBPXgGdHBSkeOR",
  render_errors: [view: Wiki.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wiki.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    core: { Ueberauth.Strategy.Core, [  ] }
  ]

config :ueberauth, Ueberauth.Strategy.Core.OAuth,
  client_id: "c62ba98b-39bc-41ca-9787-8113baf11fd0",
  client_secret: "aec80f0b-1e7a-4bf2-8392-0309ca66f2c6"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Wiki",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "C+XnZx8nnSmHN87wRwGA99WPb3tieVDSFuWsGW6T0WgcwETQt/8g6lsRGELv9lLZ",
  serializer: GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"