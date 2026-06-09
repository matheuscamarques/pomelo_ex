defmodule PomeloEx.Cards.Credits.CreditLines.ConfirmTotalDebtAccelerationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.ConfirmTotalDebtAcceleration
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Confirm Total Debt Acceleration" do
    payload = CreditLinesFixtures.confirm_total_debt_acceleration_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/acceleration/total/confirmation"

      sent_body = Jason.decode!(body)
      assert sent_body["transaction_ids"] == ["ctx-1", "ctx-2"]

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesFixtures.confirm_total_debt_acceleration_response()
       }}
    end)

    {:ok, response} = ConfirmTotalDebtAcceleration.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] =~ "Total debt accelerated"
  end
end
