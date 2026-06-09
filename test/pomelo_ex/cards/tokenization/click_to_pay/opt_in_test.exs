defmodule PomeloEx.Cards.Tokenization.ClickToPay.OptInTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.ClickToPayFixtures
  alias PomeloEx.Cards.Tokenization.ClickToPay.OptIn

  test "Success 200 - Opt-in Click to Pay" do
    payload = ClickToPayFixtures.opt_in_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/cards/#{payload.card_id}/click-to-pay"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: ClickToPayFixtures.opt_in_response()
       }}
    end)

    {:ok, response} = OptIn.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.card_id
    assert body["data"]["status"] == "ENROLLING"
  end
end
