defmodule PomeloEx.Identity.KYB.SearchSessionTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.SearchSession
  alias PomeloEx.Identity.KYBFixtures

  test "Success 200 - Search Session" do
    payload = KYBFixtures.search_session_request(%{filter_status: "IN_PROGRESS"})

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url =~ Application.get_env(:pomelo_ex, :url) <> "/identity/v1/sessions"
      assert url =~ "filter%5Bstatus%5D=IN_PROGRESS"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: KYBFixtures.search_sessions_response()
       }}
    end)

    {:ok, response} = SearchSession.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert Enum.at(body["data"], 0)["id"] == "ses-12345"
  end
end
