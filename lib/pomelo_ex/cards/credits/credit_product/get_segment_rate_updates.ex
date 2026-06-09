defmodule PomeloEx.Cards.Credits.CreditProduct.GetSegmentRateUpdates do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetSegmentRateUpdatesType

  def execute(%GetSegmentRateUpdatesType{token: token, product_id: product_id, segment_id: segment_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/products/#{product_id}/segments/#{segment_id}/pricing", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
