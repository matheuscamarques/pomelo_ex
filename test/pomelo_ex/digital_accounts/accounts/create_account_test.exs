defmodule PomeloEx.DigitalAccounts.Accounts.CreateAccountTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.Accounts.CreateAccount
  alias PomeloEx.DigitalAccounts.AccountsFixtures

  test "Success 201 - Create Account" do
    payload = AccountsFixtures.create_account_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/core/accounts/v1"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: AccountsFixtures.create_account_response()
       }}
    end)

    {:ok, response} = CreateAccount.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "acc-20I5vMjljS3VEyafcX8lA3T3g0c"
    assert body["data"]["status"] == "ACTIVE"
  end
end
