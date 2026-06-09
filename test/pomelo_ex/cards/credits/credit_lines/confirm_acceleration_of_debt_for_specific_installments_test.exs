defmodule PomeloEx.Cards.Credits.CreditLines.ConfirmAccelerationOfDebtForSpecificInstallmentsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.ConfirmAccelerationOfDebtForSpecificInstallments
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Confirm Acceleration Of Debt For Specific Installments" do
    payload = CreditLinesFixtures.confirm_acceleration_of_debt_for_specific_installments_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/acceleration/installments/confirmation"

      sent_body = Jason.decode!(body)
      assert sent_body["transaction_ids"] == ["ctx-1", "ctx-2"]

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.confirm_acceleration_of_debt_for_specific_installments_response()
       }}
    end)

    {:ok, response} = ConfirmAccelerationOfDebtForSpecificInstallments.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] =~ "Acceleration of installments"
  end
end
