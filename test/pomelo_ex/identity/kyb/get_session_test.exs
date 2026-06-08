defmodule PomeloEx.Identity.KYB.GetSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.GetSession
  alias PomeloEx.Identity.KYBFixtures

  test "Success 200 - Get Session" do
    payload = KYBFixtures.get_session_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: KYBFixtures.get_session_response()
       }}
    end)

    {:ok, response} = GetSession.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.session_id
  end
end
