defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetSegments do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentsType

  def execute(%GetSegmentsType{token: token, product_id: product_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v2/products/#{product_id}/segments", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
