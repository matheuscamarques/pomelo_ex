defmodule PomeloEx.Cards.Tokenization.ClickToPay.OptOutTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.ClickToPayFixtures
  alias PomeloEx.Cards.Tokenization.ClickToPay.OptOut

  test "Success 200 - Opt-out Click to Pay" do
    payload = ClickToPayFixtures.opt_out_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :delete, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/cards/#{payload.card_id}/click-to-pay"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: ClickToPayFixtures.opt_out_response()
       }}
    end)

    {:ok, response} = OptOut.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.card_id
    assert body["data"]["status"] == "DISENROLLING"
  end
end
