# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bitcoin_reg,
  ecto_repos: [BitcoinReg.Repo]

# Configures the endpoint
config :bitcoin_reg, BitcoinReg.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+4X15N7TgXg74/kJTLNgwlCPbS2i9LvFvDqJYt/L+JFhJLC97S0PZwV5X42K9yzO",
  render_errors: [view: BitcoinReg.ErrorView, accepts: ~w(json)],
  pubsub: [name: BitcoinReg.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
