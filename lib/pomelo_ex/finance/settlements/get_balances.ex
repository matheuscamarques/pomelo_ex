defmodule PomeloEx.Finance.Settlements.GetBalances do
  @moduledoc false

  alias PomeloEx.Types.Finance.Settlements.GetBalancesType

  def execute(%GetBalancesType{token: token, country: country}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params = URI.encode_query(%{country: country})

    http_client.get("#{url}/finance/v1/balances?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
