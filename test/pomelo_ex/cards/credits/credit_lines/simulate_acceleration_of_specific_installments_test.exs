defmodule PomeloEx.Cards.Credits.CreditLines.SimulateAccelerationOfSpecificInstallmentsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.SimulateAccelerationOfSpecificInstallments
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Simulate Acceleration Of Specific Installments" do
    payload = CreditLinesFixtures.simulate_acceleration_of_specific_installments_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/acceleration/installments/simulation"

      sent_body = Jason.decode!(body)
      assert sent_body["transaction_ids"] == ["ctx-1", "ctx-2"]

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesFixtures.simulate_acceleration_of_specific_installments_response()
       }}
    end)

    {:ok, response} = SimulateAccelerationOfSpecificInstallments.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["has_pending_operations"] == true
  end
end
