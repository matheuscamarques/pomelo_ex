defmodule PomeloEx.Identity.KYC.CancelSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.CancelSession
  alias PomeloEx.Identity.KYCFixtures

  test "Success 200 - Cancel Session" do
    payload = KYCFixtures.cancel_session_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :delete, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: "{}"
       }}
    end)

    {:ok, response} = CancelSession.execute(payload)
    assert response.status == 200
  end
end
