defmodule PomeloEx.Identity.KYC.ObtainingSessionReportTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Identity.KYC.ObtainingSessionReport
  alias PomeloEx.Identity.KYCFixtures

  test "Success 200 - Obtaining Session Report" do
    payload = KYCFixtures.obtaining_session_report_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/identity/v1/sessions/#{payload.session_id}/report"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: KYCFixtures.report_response()
       }}
    end)

    {:ok, response} = ObtainingSessionReport.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["session_id"] == payload.session_id
  end
end
