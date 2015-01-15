use Mix.Config

config :asana_status, AsanaStatus.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true,
  cache_static_lookup: false

# Enables code reloading for development
config :phoenix, :code_reloader, true
