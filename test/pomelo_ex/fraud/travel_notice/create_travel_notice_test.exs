defmodule PomeloEx.Fraud.TravelNotice.CreateTravelNoticeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TravelNotice.CreateTravelNotice
  alias PomeloEx.Fraud.TravelNoticeFixtures

  test "Success 200 - Create Travel Notice" do
    payload = TravelNoticeFixtures.create_travel_notice_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/travel_notice/v1/user"

      sent_body = Jason.decode!(body)
      assert sent_body["user_id"] == "usr-12345"
      assert sent_body["value"]["countries"] == ["ARG"]

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TravelNoticeFixtures.create_travel_notice_response()
       }}
    end)

    {:ok, response} = CreateTravelNotice.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["travel_notice"]["countries"] == ["ARG"]
  end
end
