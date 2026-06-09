defmodule PomeloEx.Cards.Issuing.Shipments.CreateShipmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.CreateShipment
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 201 - Create Shipment" do
    payload = ShipmentsFixtures.create_shipment_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/shipping/v1/"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: ShipmentsFixtures.create_shipment_response()
       }}
    end)

    {:ok, response} = CreateShipment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "shp-12345"
    assert body["data"]["batch_id"] == payload.batch_id
  end
end
