defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetSegment do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentType

  def execute(%GetSegmentType{token: token, product_id: product_id, segment_id: segment_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v2/products/#{product_id}/segments/#{segment_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
