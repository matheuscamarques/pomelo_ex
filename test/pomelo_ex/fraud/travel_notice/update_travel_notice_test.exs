defmodule PomeloEx.Fraud.TravelNotice.UpdateTravelNoticeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TravelNotice.UpdateTravelNotice
  alias PomeloEx.Fraud.TravelNoticeFixtures

  test "Success 200 - Update Travel Notice" do
    payload = TravelNoticeFixtures.update_travel_notice_request()

    expect(HTTPMock, :put, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/travel_notice/v1/user"

      sent_body = Jason.decode!(body)
      assert sent_body["user_id"] == "usr-12345"
      assert sent_body["value"]["countries"] == ["ARG", "BRA"]

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: TravelNoticeFixtures.update_travel_notice_response()
       }}
    end)

    {:ok, response} = UpdateTravelNotice.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["travel_notice"]["countries"] == ["ARG", "BRA"]
  end
end
