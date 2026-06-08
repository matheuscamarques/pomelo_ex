defmodule PomeloEx.Identity.KYB.CreateSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.CreateSession
  alias PomeloEx.Identity.KYBFixtures

  test "Success 201 - Create Session" do
    payload = KYBFixtures.create_session_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/identity/v2/sessions"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: KYBFixtures.create_session_response()
       }}
    end)

    {:ok, response} = CreateSession.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "ses-12345"
  end
end
