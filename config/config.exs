# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the namespace used by Phoenix generators
config :asana_status,
  phoenix_namespace: AsanaStatus

# Configures the endpoint
config :asana_status, AsanaStatus.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FazmAK5a+lo261N4mls+CdYvKrAVF+K0mfcrffo/GhdNiNTOsv9xTIe76ZOyz6ay",
  debug_errors: false

# Application configuration
config :asana_status, :asana_api_key, System.get_env("ASANA_API_KEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
