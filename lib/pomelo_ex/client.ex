defmodule PomeloEx.Client do
  @moduledoc false
  def request(method, path, body, headers) do
    adapter = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)

    adapter.request(method, url <> path, body, headers)
  end
end
