defmodule PomeloEx.Cards.Credits.CreditLines.GetCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.GetCreditLine
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Get Credit Line" do
    payload = CreditLinesFixtures.get_credit_line_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.get_credit_line_response()
       }}
    end)

    {:ok, response} = GetCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "ACTIVE"
  end
end
