defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetSegment do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentType

  def execute(%GetSegmentType{token: token, product_id: product_id, segment_id: segment_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(
      :get,
      "/lending/v2/products/#{product_id}/segments/#{segment_id}",
      nil,
      headers
    )
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
