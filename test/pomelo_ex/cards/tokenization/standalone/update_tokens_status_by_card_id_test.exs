defmodule PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.StandaloneTokenizationFixtures
  alias PomeloEx.Cards.Tokenization.Standalone.UpdateTokensStatusByCardId

  test "Success 200 - Update Tokens Status by Card ID" do
    payload = StandaloneTokenizationFixtures.update_tokens_status_by_card_id_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/tokens/cards/#{payload.card_id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: StandaloneTokenizationFixtures.update_tokens_status_by_card_id_response()
       }}
    end)

    {:ok, response} = UpdateTokensStatusByCardId.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["card_id"] == payload.card_id
    assert body["data"]["status"] == "SUSPENDED"
  end
end
