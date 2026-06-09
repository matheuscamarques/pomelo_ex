defmodule PomeloEx.Cards.Tokenization.GetTokenByIdTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.GetTokenById
  alias PomeloEx.Cards.TokenizationFixtures

  test "Success 200 - Get Token by ID" do
    payload = TokenizationFixtures.get_token_by_id_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/tokens/#{payload.external_token_id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TokenizationFixtures.token_response()
       }}
    end)

    {:ok, response} = GetTokenById.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.external_token_id
  end
end
