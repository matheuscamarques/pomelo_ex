defmodule PomeloEx.Cards.Credits.CreditLinesV2.CreateCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 201 - Create Credit Line" do
    payload = CreditLinesV2Fixtures.create_credit_line_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/lending/v2/credit-lines"

      sent_body = Jason.decode!(body)
      assert sent_body["user_id"] == "usr-v2-user-id"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditLinesV2Fixtures.create_credit_line_response()
       }}
    end)

    {:ok, response} = CreateCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lcr-v2-credit-line-id"
  end
end
