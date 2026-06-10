defmodule PomeloEx.Cards.Credits.AvailablePlans.GetRefinancingPlansTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.AvailablePlans.GetRefinancingPlans
  alias PomeloEx.Cards.Credits.AvailablePlansFixtures

  test "Success 200 - Get Refinancing Plans" do
    payload = AvailablePlansFixtures.get_refinancing_plans_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert String.contains?(
               url,
               "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/refinancing-plans/"
             )

      assert String.contains?(url, "filter[status]=OPEN")
      assert String.contains?(url, "page[number]=0")
      assert String.contains?(url, "page[size]=10")

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: AvailablePlansFixtures.get_refinancing_plans_response()
       }}
    end)

    {:ok, response} = GetRefinancingPlans.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1

    assert body["data"] |> List.first() |> Map.get("credit_line_id") ==
             "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe"
  end
end
