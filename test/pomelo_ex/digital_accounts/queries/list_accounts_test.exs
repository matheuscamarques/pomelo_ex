defmodule PomeloEx.DigitalAccounts.Queries.ListAccountsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.Queries.ListAccounts
  alias PomeloEx.DigitalAccounts.QueriesFixtures

  test "Success 200 - List Accounts" do
    payload = QueriesFixtures.list_accounts_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/core/accounts/v1/?filter%5Bcountry%5D=ARG"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: QueriesFixtures.list_accounts_response()
       }}
    end)

    {:ok, response} = ListAccounts.execute(payload)

    body = Jason.decode!(response.body)
    assert body["meta"]["pagination"]["total_pages"] == 10

    account_id =
      body
      |> Map.fetch!("data")
      |> List.first()
      |> Map.fetch!("id")

    assert account_id == "acc-20i4O5MIKHooZpOV8j5s7nxV5pl"
  end
end
