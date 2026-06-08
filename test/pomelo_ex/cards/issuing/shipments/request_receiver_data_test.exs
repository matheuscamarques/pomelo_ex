defmodule PomeloEx.Cards.Issuing.Shipments.RequestReceiverDataTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Issuing.Shipments.RequestReceiverData
  alias PomeloEx.Cards.ShipmentsFixtures

  test "Success 200 - Request Receiver Data" do
    payload = ShipmentsFixtures.request_receiver_data_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/shipping/v1/#{payload.shipment_id}/receiver"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ShipmentsFixtures.request_receiver_data_response()
       }}
    end)

    {:ok, response} = RequestReceiverData.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["shipment_id"] == payload.shipment_id
    assert body["data"]["request_status"] == "REQUESTED_RECEIVER_DATA"
  end
end
