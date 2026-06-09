defmodule PomeloEx.Cards.Credits.Statements.GetLastStatementsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Statements.GetLastStatements
  alias PomeloEx.Cards.Credits.StatementsFixtures

  test "Success 200 - Get Last Statement" do
    payload = StatementsFixtures.get_last_statements_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/statements/last"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: StatementsFixtures.get_last_statements_response()
       }}
    end)

    {:ok, response} = GetLastStatements.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "GENERATED"
  end
end
