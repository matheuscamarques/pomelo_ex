defmodule PomeloEx.Cards.Credits.CreditLines.SimulateDebtRefinancingTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.SimulateDebtRefinancing
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Simulate Debt Refinancing" do
    payload = CreditLinesFixtures.simulate_debt_refinancing_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/refinance/simulation"

      sent_body = Jason.decode!(body)
      assert sent_body["type"] == "TOTAL_DEBT"
      assert sent_body["installment_quantity"] == 12

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.simulate_debt_refinancing_response()
       }}
    end)

    {:ok, response} = SimulateDebtRefinancing.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["has_pending_operations"] == false
  end
end
