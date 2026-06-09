defmodule PomeloEx.Identity.KYC.GetSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.GetSession
  alias PomeloEx.Identity.KYCFixtures

  test "Success 200 - Get Session" do
    payload = KYCFixtures.get_session_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: KYCFixtures.get_session_response()
       }}
    end)

    {:ok, response} = GetSession.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.session_id
  end
end
