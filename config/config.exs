# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :task_app,
  ecto_repos: [TaskApp.Repo]

# Configures the endpoint
config :task_app, TaskAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5gq4SsBonU543X4jpGRGmOBea5XqfyQzOHpPjAO9I96VZYXB7dgFRT+J9eGPKbgk",
  render_errors: [view: TaskAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TaskApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "fWcfFpz1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :task_app, :pow,
  user: TaskApp.Users.User,
  repo: TaskApp.Repo,
  web_module: TaskAppWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: TaskAppWeb.PowMailer

config :task_app, :pow_assent,
  providers: [
    github: [
      client_id: "dc923edbc767638ba772",
      client_secret: "57c618a7c736e8b90befeb33d179683fd09a2b17",
      strategy: Assent.Strategy.Github
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
