import Config

config :pomelo_ex, :http_adapter, HTTPoison
config :pomelo_ex, :idempotency_key_length, 14

import_config "#{config_env()}.exs"
