defmodule PomeloEx.Cards.Credits.CreditLines.CreateCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.CreateCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 201 - Create Credit Line" do
    payload = CreditLinesFixtures.create_credit_line_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/lending/v1/credit-lines"

      sent_body = Jason.decode!(body)
      assert sent_body["user_id"] == "usr-2HMwJZo114goVi7xdSseYfujP79"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditLinesFixtures.create_credit_line_response()
       }}
    end)

    {:ok, response} = CreateCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lcr-2HMwKzetERdOEhbT86UweXamPle"
  end
end
