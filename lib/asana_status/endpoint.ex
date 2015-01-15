defmodule AsanaStatus.Endpoint do
  use Phoenix.Endpoint, otp_app: :asana_status

  plug Plug.Static,
    at: "/", from: :asana_status

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_asana_status_key",
    signing_salt: "lWdRyWKY",
    encryption_salt: "xhk9kf8K"

  plug :router, AsanaStatus.Router
end
