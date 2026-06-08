defmodule PomeloEx.Cards.Tokenization.UnsuspendTokenTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.UnsuspendToken
  alias PomeloEx.Cards.TokenizationFixtures

  test "Success 200 - Unsuspend Token" do
    payload = TokenizationFixtures.unsuspend_token_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/tokens/#{payload.external_token_id}/unsuspension"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: TokenizationFixtures.unsuspend_token_response()
       }}
    end)

    {:ok, response} = UnsuspendToken.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.external_token_id
    assert body["data"]["status"] == "ACTIVE"
  end
end
