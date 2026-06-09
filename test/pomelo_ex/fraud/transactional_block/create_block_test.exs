defmodule PomeloEx.Fraud.TransactionalBlock.CreateBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TransactionalBlock.CreateBlock
  alias PomeloEx.Fraud.TransactionalBlockFixtures

  test "Success 200 - Create Block" do
    payload = TransactionalBlockFixtures.create_block_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/merchant_id/block"

      sent_body = Jason.decode!(body)
      assert sent_body["merchant_id"] == "123456799999"
      assert sent_body["expiration_date"] == "3000-01-01T13:40:23Z"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: TransactionalBlockFixtures.create_block_response()
       }}
    end)

    {:ok, response} = CreateBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "BLOCKLIST applied successfully."
  end
end
