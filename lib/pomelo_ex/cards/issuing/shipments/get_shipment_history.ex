defmodule PomeloEx.Cards.Issuing.Shipments.GetShipmentHistory do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetShipmentHistoryType

  def execute(%GetShipmentHistoryType{token: token, shipment_id: shipment_id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/shipping/v1/#{shipment_id}/history", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
