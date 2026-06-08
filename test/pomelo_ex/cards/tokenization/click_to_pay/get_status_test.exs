defmodule PomeloEx.Cards.Tokenization.ClickToPay.GetStatusTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.ClickToPayFixtures
  alias PomeloEx.Cards.Tokenization.ClickToPay.GetStatus

  test "Success 200 - Get Click to Pay Status" do
    payload = ClickToPayFixtures.get_status_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/cards/#{payload.card_id}/click-to-pay"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ClickToPayFixtures.get_status_response()
       }}
    end)

    {:ok, response} = GetStatus.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.card_id
    assert body["data"]["status"] == "ENROLLED"
  end
end
