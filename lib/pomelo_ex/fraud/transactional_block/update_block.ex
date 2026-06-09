defmodule PomeloEx.Fraud.TransactionalBlock.UpdateBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.UpdateBlockType

  def execute(%UpdateBlockType{token: token, type: type, body: body}) do
    headers = build_headers(token)

    body = body |> Jason.encode!()

    PomeloEx.Client.request(:put, "/fraud/#{type}/block", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
