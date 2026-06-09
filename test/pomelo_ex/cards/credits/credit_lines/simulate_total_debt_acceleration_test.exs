defmodule PomeloEx.Cards.Credits.CreditLines.SimulateTotalDebtAccelerationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.SimulateTotalDebtAcceleration
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Simulate Total Debt Acceleration" do
    payload = CreditLinesFixtures.simulate_total_debt_acceleration_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/acceleration/total/simulation"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesFixtures.simulate_total_debt_acceleration_response()
       }}
    end)

    {:ok, response} = SimulateTotalDebtAcceleration.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["has_pending_operations"] == true
  end
end
