defmodule PomeloEx.Cards.Tokenization.SuspendTokenTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.SuspendToken
  alias PomeloEx.Cards.TokenizationFixtures

  test "Success 200 - Suspend Token" do
    payload = TokenizationFixtures.suspend_token_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/tokens/#{payload.external_token_id}/suspension"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TokenizationFixtures.suspend_token_response()
       }}
    end)

    {:ok, response} = SuspendToken.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.external_token_id
    assert body["data"]["status"] == "SUSPENDED"
  end
end
