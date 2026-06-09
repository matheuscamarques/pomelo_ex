defmodule PomeloEx.Loyalty.GetAccountBalanceTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Loyalty.GetAccountBalance
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Get Account Balance" do
    payload = LoyaltyFixtures.get_account_balance_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/loyalty/v1/accounts/balance?card_id=card_123456"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: LoyaltyFixtures.get_account_balance_response()
       }}
    end)

    {:ok, response} = GetAccountBalance.execute(payload)

    body = Jason.decode!(response.body)
    assert body["points"] == 5000
    assert body["cashback"] == 250
  end
end
