defmodule PomeloEx.Fraud.TransactionalBlock.GetBlockStatusTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TransactionalBlock.GetBlockStatus
  alias PomeloEx.Fraud.TransactionalBlockFixtures

  test "Success 200 - Get Block Status" do
    payload = TransactionalBlockFixtures.get_block_status_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/merchant_id/block/123456799999"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TransactionalBlockFixtures.get_block_status_response()
       }}
    end)

    {:ok, response} = GetBlockStatus.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "FACEBOOK*MARKET"
  end
end
