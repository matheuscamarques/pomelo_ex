defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.GetCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Get Credit Line" do
    payload = CreditLinesV2Fixtures.get_credit_line_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/credit-lines/lcr-v2-credit-line-id"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.get_credit_line_response()
       }}
    end)

    {:ok, response} = GetCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lcr-v2-credit-line-id"
  end
end
