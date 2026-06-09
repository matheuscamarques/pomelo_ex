defmodule PomeloEx.Cards.Credits.Statements.GetStatementTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Statements.GetStatement
  alias PomeloEx.Cards.Credits.StatementsFixtures

  test "Success 200 - Get Statement" do
    payload = StatementsFixtures.get_statement_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert String.contains?(url, "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/statements/lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP")
      assert String.contains?(url, "extended=pdf_url")

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: StatementsFixtures.get_statement_response()
       }}
    end)

    {:ok, response} = GetStatement.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP"
  end
end
