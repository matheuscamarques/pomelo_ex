defmodule PomeloEx.Cards.Credits.CreditLinesV2.CancelCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.CancelCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Cancel Credit Line" do
    payload = CreditLinesV2Fixtures.cancel_credit_line_request()

    expect(HTTPMock, :delete, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/credit-lines/lcr-v2-credit-line-id"

      sent_body = Jason.decode!(body)
      assert sent_body["reason"] == "USER_REQUESTED"
      assert sent_body["debt_acceleration"] == true

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesV2Fixtures.cancel_credit_line_response()
       }}
    end)

    {:ok, response} = CancelCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["lifecycle"]["status"] == "CANCELLED"
  end
end
