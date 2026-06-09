defmodule PomeloEx.Cards.Credits.CreditLines.DebtAccelerationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.DebtAcceleration
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Debt Acceleration" do
    payload = CreditLinesFixtures.debt_acceleration_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/debt/acceleration"

      sent_body = Jason.decode!(body)
      assert sent_body["transaction_ids"] == ["ctx-1", "ctx-2"]

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.debt_acceleration_response()
       }}
    end)

    {:ok, response} = DebtAcceleration.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "Debt acceleration confirmed"
  end
end
