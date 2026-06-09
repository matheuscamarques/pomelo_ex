defmodule PomeloEx.Cards.Credits.CreditProduct.GetSegmentRateUpdates do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetSegmentRateUpdatesType

  def execute(%GetSegmentRateUpdatesType{token: token, product_id: product_id, segment_id: segment_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/products/#{product_id}/segments/#{segment_id}/pricing", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
