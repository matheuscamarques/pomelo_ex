defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalanceTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalance
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2PFixtures

  test "Success 200 - Update Account Balance" do
    payload = DigitalMovementsAndP2PFixtures.update_account_balance_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/core/accounts/v1/#{payload.account_id}/balance"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: DigitalMovementsAndP2PFixtures.update_account_balance_response()
       }}
    end)

    {:ok, response} = UpdateAccountBalance.execute(payload)

    body = Jason.decode!(response.body)
    assert body["result"] == "APPLIED"
  end
end
