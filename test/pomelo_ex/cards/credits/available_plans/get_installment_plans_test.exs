defmodule PomeloEx.Cards.Credits.AvailablePlans.GetInstallmentPlansTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.AvailablePlans.GetInstallmentPlans
  alias PomeloEx.Cards.Credits.AvailablePlansFixtures

  test "Success 200 - Get Installment Plans" do
    payload = AvailablePlansFixtures.get_installment_plans_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert String.contains?(url, "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/installment-plans/")
      assert String.contains?(url, "filter[status]=OPEN")
      assert String.contains?(url, "page[number]=0")
      assert String.contains?(url, "page[size]=10")

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AvailablePlansFixtures.get_installment_plans_response()
       }}
    end)

    {:ok, response} = GetInstallmentPlans.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
    assert body["data"] |> List.first() |> Map.get("credit_line_id") == "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe"
  end
end
