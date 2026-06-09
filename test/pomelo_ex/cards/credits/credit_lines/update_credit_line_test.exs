defmodule PomeloEx.Cards.Credits.CreditLines.UpdateCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.UpdateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Update Credit Line" do
    payload = CreditLinesFixtures.update_credit_line_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle"

      sent_body = Jason.decode!(body)
      assert sent_body["status"] == "PAUSED"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.update_credit_line_response()
       }}
    end)

    {:ok, response} = UpdateCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "PAUSED"
  end
end
