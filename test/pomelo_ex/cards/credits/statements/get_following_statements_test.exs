defmodule PomeloEx.Cards.Credits.Statements.GetFollowingStatementsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Statements.GetFollowingStatements
  alias PomeloEx.Cards.Credits.StatementsFixtures

  test "Success 200 - Get Following Statement" do
    payload = StatementsFixtures.get_following_statements_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe/statements/next"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: StatementsFixtures.get_following_statements_response()
       }}
    end)

    {:ok, response} = GetFollowingStatements.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "GENERATED"
  end
end
