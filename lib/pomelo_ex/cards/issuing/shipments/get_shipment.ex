defmodule PomeloEx.Cards.Issuing.Shipments.GetShipment do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetShipmentType

  def execute(%GetShipmentType{token: token, shipment_id: shipment_id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/shipping/v1/#{shipment_id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
