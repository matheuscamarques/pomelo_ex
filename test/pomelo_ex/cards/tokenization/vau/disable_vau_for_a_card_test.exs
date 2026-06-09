defmodule PomeloEx.Cards.Tokenization.VAU.DisableVauForACardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.VAU.DisableVauForACard
  alias PomeloEx.Cards.VAUFixtures

  test "Success 200 - Disable VAU for a Card" do
    payload = VAUFixtures.disable_vau_for_a_card_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/pan-lifecycle/vau-opt-out"

      decoded_body = Jason.decode!(body)
      assert decoded_body["card_id"] == payload.card_id
      assert decoded_body["operator_id"] == payload.operator_id

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: VAUFixtures.vau_success_response()
       }}
    end)

    {:ok, response} = DisableVauForACard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "SUCCESS"
  end
end
