defmodule PomeloEx.DigitalAccounts.Accounts.UpdateAccountStatusTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.Accounts.UpdateAccountStatus
  alias PomeloEx.DigitalAccounts.AccountsFixtures

  test "Success 200 - Update Account Status" do
    payload = AccountsFixtures.update_account_status_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/core/accounts/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AccountsFixtures.update_account_status_response()
       }}
    end)

    {:ok, response} = UpdateAccountStatus.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "ACTIVE"
  end
end
