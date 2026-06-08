defmodule PomeloEx.Cards.Issuing.Shipments.GetShipmentHistoryTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.GetShipmentHistory
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 200 - Get Shipment History" do
    payload = ShipmentsFixtures.get_shipment_history_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/shipping/v1/#{payload.shipment_id}/history"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ShipmentsFixtures.get_shipment_history_response()
       }}
    end)

    {:ok, response} = GetShipmentHistory.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert length(body["data"]) == 2
  end
end
