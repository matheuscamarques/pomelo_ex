defmodule PomeloEx.Identity.KYB.CancelSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.CancelSession
  alias PomeloEx.Identity.KYBFixtures

  test "Success 200 - Cancel Session" do
    payload = KYBFixtures.cancel_session_request()

    expect(HTTPMock, :delete, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/identity/v1/sessions/#{payload.session_id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: "{}"
       }}
    end)

    {:ok, response} = CancelSession.execute(payload)
    assert response.status_code == 200
  end
end
