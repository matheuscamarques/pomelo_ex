defmodule PomeloEx.Cards.Issuing.Shipments.ChangeShipmentDataTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.ChangeShipmentData
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 200 - Change Shipment Data" do
    payload = ShipmentsFixtures.change_shipment_data_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/shipping/v1/#{payload.shipment_id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: ShipmentsFixtures.change_shipment_data_response()
       }}
    end)

    {:ok, response} = ChangeShipmentData.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.shipment_id
    assert body["data"]["request_status"] == "PENDING_UPDATE_ADDRESS"
  end
end
