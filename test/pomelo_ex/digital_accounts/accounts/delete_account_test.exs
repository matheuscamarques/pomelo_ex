defmodule PomeloEx.DigitalAccounts.Accounts.DeleteAccountTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.Accounts.DeleteAccount
  alias PomeloEx.DigitalAccounts.AccountsFixtures

  test "Success 200 - Delete Account" do
    payload = AccountsFixtures.delete_account_request()

    expect(HTTPMock, :delete, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/core/accounts/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AccountsFixtures.delete_account_response()
       }}
    end)

    {:ok, response} = DeleteAccount.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "DELETED"
  end
end
