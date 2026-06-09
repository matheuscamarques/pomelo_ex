defmodule PomeloEx.Cards.Credits.CreditProduct.ModifyPendingPriceUpdate do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.ModifyPendingPriceUpdateType

  def execute(%ModifyPendingPriceUpdateType{token: token, product_id: product_id, start_date: start_date} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    http_client.patch("#{url}/lending/v1/products/#{product_id}/pricing/#{start_date}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
