defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShipping do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.UpdateCardBatchShippingType

  def execute(%UpdateCardBatchShippingType{token: token, shipment_id: shipment_id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:shipment_id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/cards/v1/batches/shipments/#{shipment_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
