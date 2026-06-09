defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardShippingTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardShipping

  test "Success 200 - Update Card Shipping" do
    payload = CardsFixtures.update_card_shipping_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/#{payload.id}/shipment"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CardsFixtures.update_card_shipping_response()
       }}
    end)

    {:ok, response} = UpdateCardShipping.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["shipment_id"] == "shp-12345"
  end
end
