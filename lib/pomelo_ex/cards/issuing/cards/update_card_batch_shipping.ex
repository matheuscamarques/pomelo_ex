defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShipping do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.UpdateCardBatchShippingType

  def execute(%UpdateCardBatchShippingType{token: token, shipment_id: shipment_id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:shipment_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.patch("#{url}/cards/v1/batches/shipments/#{shipment_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
