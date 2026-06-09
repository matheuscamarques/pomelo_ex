defmodule PomeloEx.Cards.Tokenization.GetTokensByCardIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.GetTokensByCardId
  alias PomeloEx.Cards.TokenizationFixtures

  test "Success 200 - Get Tokens by Card ID" do
    payload = TokenizationFixtures.get_tokens_by_card_id_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url =~
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/cards/#{payload.external_card_id}/tokens"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TokenizationFixtures.get_tokens_by_card_id_response()
       }}
    end)

    {:ok, response} = GetTokensByCardId.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert hd(body["data"])["card_id"] == payload.external_card_id
  end
end
