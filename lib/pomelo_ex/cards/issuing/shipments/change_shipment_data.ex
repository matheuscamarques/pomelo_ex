defmodule PomeloEx.Cards.Issuing.Shipments.ChangeShipmentData do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.ChangeShipmentDataType

  def execute(%ChangeShipmentDataType{token: token, shipment_id: shipment_id} = payload) do
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

    http_client.patch("#{url}/shipping/v1/#{shipment_id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
