defmodule PomeloEx.Finance.Settlements.GetBalances do
  @moduledoc false

  alias PomeloEx.Types.Finance.Settlements.GetBalancesType

  def execute(%GetBalancesType{token: token, country: country}) do
    headers = build_headers(token)

    params = URI.encode_query(%{country: country})

    PomeloEx.Client.request(:get, "/finance/v1/balances?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
