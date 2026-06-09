defmodule PomeloEx.Cards.Credits.CreditLinesV2.ModifyPricing do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.ModifyPricingType

  def execute(%ModifyPricingType{token: token, product_id: product_id} = payload) do
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/lending/v2/products/#{product_id}/pricing", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
