defmodule PomeloEx.Cards.Issuing.Shipments.GetShipmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.GetShipment
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 200 - Get Shipment" do
    payload = ShipmentsFixtures.get_shipment_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/shipping/v1/#{payload.shipment_id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ShipmentsFixtures.get_shipment_response()
       }}
    end)

    {:ok, response} = GetShipment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.shipment_id
    assert body["data"]["status"] == "IN_TRANSIT"
  end
end
