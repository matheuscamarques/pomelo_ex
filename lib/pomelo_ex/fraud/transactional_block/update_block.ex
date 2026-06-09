defmodule PomeloEx.Fraud.TransactionalBlock.UpdateBlock do
  @moduledoc false

  alias PomeloEx.Types.Fraud.TransactionalBlock.UpdateBlockType

  def execute(%UpdateBlockType{token: token, type: type, body: body}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = body |> Jason.encode!()

    http_client.put("#{url}/fraud/#{type}/block", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
