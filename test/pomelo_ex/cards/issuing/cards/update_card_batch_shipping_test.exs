defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShippingTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShipping

  test "Success 200 - Update Card Batch Shipping" do
    payload = CardsFixtures.update_card_batch_shipping_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/cards/v1/batches/shipments/#{payload.shipment_id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CardsFixtures.update_card_batch_shipping_response()
       }}
    end)

    {:ok, response} = UpdateCardBatchShipping.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["shipment_id"] == payload.shipment_id
    assert body["data"]["status"] == "UPDATED"
  end
end
