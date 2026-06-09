defmodule PomeloEx.Cards.SensitiveInformation.Authorization.CreateUserTokenTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.SensitiveInformation.Authorization.CreateUserToken
  alias PomeloEx.Cards.SensitiveInformationFixtures

  test "Success 200 - Create User Token" do
    payload = SensitiveInformationFixtures.create_user_token_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/cards/v1/tokens"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: SensitiveInformationFixtures.create_user_token_response()
       }}
    end)

    {:ok, response} = CreateUserToken.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["token"] == "usr_tok-12345"
  end
end
