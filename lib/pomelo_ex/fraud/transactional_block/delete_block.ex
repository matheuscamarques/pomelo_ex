defmodule PomeloEx.Fraud.TransactionalBlock.DeleteBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.DeleteBlockType

  def execute(%DeleteBlockType{token: token, type: type, identifier: identifier}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:delete, "/fraud/#{type}/block/#{identifier}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
