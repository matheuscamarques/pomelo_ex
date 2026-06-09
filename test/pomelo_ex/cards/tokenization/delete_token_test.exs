defmodule PomeloEx.Cards.Tokenization.DeleteTokenTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.DeleteToken
  alias PomeloEx.Cards.TokenizationFixtures

  test "Success 200 - Delete Token" do
    payload = TokenizationFixtures.delete_token_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/tokenization/v1/tokens/#{payload.external_token_id}/deletion"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TokenizationFixtures.delete_token_response()
       }}
    end)

    {:ok, response} = DeleteToken.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.external_token_id
    assert body["data"]["status"] == "DELETED"
  end
end
