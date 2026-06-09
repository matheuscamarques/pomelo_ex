defmodule PomeloEx.Loyalty.GetAccountBalance do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.GetAccountBalanceType

  def execute(%GetAccountBalanceType{token: token} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Map.new()
      |> URI.encode_query()

    http_client.get("#{url}/loyalty/v1/accounts/balance?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
