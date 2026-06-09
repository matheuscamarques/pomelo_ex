defmodule PomeloEx.Finance.Settlements.NotifyDepositTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Finance.Settlements.NotifyDeposit
  alias PomeloEx.Finance.SettlementsFixtures

  test "Success 201 - Notify Deposit" do
    payload = SettlementsFixtures.notify_deposit_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/finance/v1/deposits"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: SettlementsFixtures.notify_deposit_response()
       }}
    end)

    {:ok, response} = NotifyDeposit.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "dep-3A6GlWtHT1Tfpb5mcMLxatRSmNv"
    assert body["data"]["status"] == "REVISION"
  end
end
