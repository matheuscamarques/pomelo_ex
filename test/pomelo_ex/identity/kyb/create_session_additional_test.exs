defmodule PomeloEx.Identity.KYB.CreateSessionAdditionalTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.CreateSessionAdditional
  alias PomeloEx.Identity.KYBFixtures

  test "Success 201 - Create Session Additional" do
    payload = KYBFixtures.create_session_additional_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/identity/v2/sessions"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: KYBFixtures.create_session_additional_response()
       }}
    end)

    {:ok, response} = CreateSessionAdditional.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "ses-12346"
  end
end
