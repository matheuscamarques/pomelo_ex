defmodule PomeloEx.Loyalty.GetAccountBalance do
  @moduledoc false

  alias PomeloEx.Types.Loyalty.GetAccountBalanceType

  def execute(%GetAccountBalanceType{token: token} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Map.new()
      |> URI.encode_query()

    PomeloEx.Client.request(:get, "/loyalty/v1/accounts/balance?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
