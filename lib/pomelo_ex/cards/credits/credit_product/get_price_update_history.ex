defmodule PomeloEx.Cards.Credits.CreditProduct.GetPriceUpdateHistory do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetPriceUpdateHistoryType

  def execute(%GetPriceUpdateHistoryType{token: token, product_id: product_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/products/#{product_id}/pricing", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
