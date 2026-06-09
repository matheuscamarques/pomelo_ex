defmodule PomeloEx.Fraud.TransactionalBlock.GetBlockStatus do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.GetBlockStatusType

  def execute(%GetBlockStatusType{token: token, type: type, identifier: identifier}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/fraud/#{type}/block/#{identifier}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
