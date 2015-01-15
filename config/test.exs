use Mix.Config

config :asana_status, AsanaStatus.Endpoint,
  http: [port: System.get_env("PORT") || 4001]

# Enables code reloading for test
config :phoenix, :code_reloader, true
