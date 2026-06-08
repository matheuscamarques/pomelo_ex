defmodule PomeloEx.Cards.Issuing.Shipments.SearchShipmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.SearchShipment
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 200 - Search Shipments" do
    payload = ShipmentsFixtures.search_shipment_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url =~ Application.get_env(:pomelo_ex, :url) <> "/shipping/v1/?"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ShipmentsFixtures.search_shipment_response()
       }}
    end)

    {:ok, response} = SearchShipment.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert hd(body["data"])["id"] == "shp-12345"
  end
end
