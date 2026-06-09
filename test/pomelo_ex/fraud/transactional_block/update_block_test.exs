defmodule PomeloEx.Fraud.TransactionalBlock.UpdateBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TransactionalBlock.UpdateBlock
  alias PomeloEx.Fraud.TransactionalBlockFixtures

  test "Success 200 - Update Block" do
    payload = TransactionalBlockFixtures.update_block_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :put, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/merchant_id/block"

      sent_body = Jason.decode!(body)
      assert sent_body["merchant_id"] == "123456799999"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TransactionalBlockFixtures.update_block_response()
       }}
    end)

    {:ok, response} = UpdateBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "BLOCKLIST applied successfully."
  end
end
