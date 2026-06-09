defmodule PomeloEx.Cards.Credits.CreditLinesV2.UpdateCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Update Credit Line" do
    payload = CreditLinesV2Fixtures.update_credit_line_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/credit-lines/lcr-v2-credit-line-id"

      sent_body = Jason.decode!(body)
      assert sent_body["person_type"] == "LEGAL"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.update_credit_line_response()
       }}
    end)

    {:ok, response} = UpdateCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["person_type"] == "LEGAL"
  end
end
