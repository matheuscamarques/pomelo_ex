defmodule PomeloEx.Cards.Credits.CreditLines.DebtSimulationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.DebtSimulation
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Debt Simulation" do
    payload = CreditLinesFixtures.debt_simulation_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/simulation/?transaction_ids=ctx-1,ctx-2"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.debt_simulation_response()
       }}
    end)

    {:ok, response} = DebtSimulation.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["has_pending_operations"] == true
  end
end
