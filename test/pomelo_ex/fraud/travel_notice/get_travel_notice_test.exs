defmodule PomeloEx.Fraud.TravelNotice.GetTravelNoticeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TravelNotice.GetTravelNotice
  alias PomeloEx.Fraud.TravelNoticeFixtures

  test "Success 200 - Get Travel Notice" do
    payload = TravelNoticeFixtures.get_travel_notice_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/travel_notice/v1/user/usr-12345"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: TravelNoticeFixtures.get_travel_notice_response()
       }}
    end)

    {:ok, response} = GetTravelNotice.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["travel_notice_exp_date"] == "2024-03-09T00:00:00Z"
  end
end
