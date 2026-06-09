defmodule PomeloEx.Fraud.TransactionalBlock.DeleteBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TransactionalBlock.DeleteBlock
  alias PomeloEx.Fraud.TransactionalBlockFixtures

  test "Success 200 - Delete Block" do
    payload = TransactionalBlockFixtures.delete_block_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :delete, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/merchant_id/block/123456799999"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TransactionalBlockFixtures.delete_block_response()
       }}
    end)

    {:ok, response} = DeleteBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "BLOCKLIST deleted successfully."
  end
end
