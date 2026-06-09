defmodule PomeloEx.Cards.Credits.CreditLines.CancelCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.CancelCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Cancel Credit Line" do
    payload = CreditLinesFixtures.cancel_credit_line_request()

    expect(HTTPMock, :delete, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle"

      sent_body = Jason.decode!(body)
      assert sent_body["reason"] == "BY_USER_WITHOUT_DEBT_ACCELERATION"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.cancel_credit_line_response()
       }}
    end)

    {:ok, response} = CancelCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lcr-2HMwKzetERdOEhbT86UweXamPle"
  end
end
