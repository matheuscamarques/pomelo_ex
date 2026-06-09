defmodule PomeloEx.Cards.Credits.CreditLinesV2.UpdateSegment do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.UpdateSegmentType

  def execute(%UpdateSegmentType{token: token, product_id: product_id, segment_id: segment_id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)
    body = payload.body |> Jason.encode!()

    http_client.patch("#{url}/lending/v2/products/#{product_id}/segments/#{segment_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
