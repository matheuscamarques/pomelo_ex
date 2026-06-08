defmodule PomeloEx.Identity.KYC.SearchSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.SearchSession
  alias PomeloEx.Identity.KYCFixtures

  test "Success 200 - Search Session" do
    payload = KYCFixtures.search_session_request(%{filter_status: "IN_PROGRESS"})

    expect(HTTPMock, :get, fn url, _headers ->
      assert url =~ Application.get_env(:pomelo_ex, :url) <> "/identity/v1/sessions"
      assert url =~ "filter%5Bstatus%5D=IN_PROGRESS"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: KYCFixtures.search_sessions_response()
       }}
    end)

    {:ok, response} = SearchSession.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert Enum.at(body["data"], 0)["id"] == "ses-12345"
  end
end
