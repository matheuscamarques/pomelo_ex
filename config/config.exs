import Config

config :pomelo_ex, :http_adapter, HTTPoison

import_config "#{config_env()}.exs"
