defmodule PomeloEx.Identity.KYB.ObtainingSessionReportTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYB.ObtainingSessionReport
  alias PomeloEx.Identity.KYBFixtures

  test "Success 200 - Obtaining Session Report" do
    payload = KYBFixtures.obtaining_session_report_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/identity/v1/sessions/#{payload.session_id}/report"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: KYBFixtures.report_response()
       }}
    end)

    {:ok, response} = ObtainingSessionReport.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["session_id"] == payload.session_id
  end
end
