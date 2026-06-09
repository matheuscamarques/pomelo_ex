defmodule PomeloEx.Fraud.TransactionalBlock.GetBlockStatus do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.GetBlockStatusType

  def execute(%GetBlockStatusType{token: token, type: type, identifier: identifier}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/fraud/#{type}/block/#{identifier}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
