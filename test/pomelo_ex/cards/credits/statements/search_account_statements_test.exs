defmodule PomeloEx.Cards.Credits.Statements.SearchAccountStatementsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Statements.SearchAccountStatements
  alias PomeloEx.Cards.Credits.StatementsFixtures

  test "Success 200 - Search Account Statements" do
    payload = StatementsFixtures.search_account_statements_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert String.contains?(
               url,
               "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/statements/"
             )

      assert String.contains?(url, "filter[status]=CREATED")
      assert String.contains?(url, "filter[period][from]=2023-03")
      assert String.contains?(url, "filter[period][to]=2023-04")
      assert String.contains?(url, "include=rates,limits")
      assert String.contains?(url, "page[size]=10")
      assert String.contains?(url, "page[number]=2")
      assert String.contains?(url, "sort=status,-period")

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: StatementsFixtures.search_account_statements_response()
       }}
    end)

    {:ok, response} = SearchAccountStatements.execute(payload)

    body = Jason.decode!(response.body)
    assert body["meta"]["pagination"]["total_pages"] == 1
  end
end
