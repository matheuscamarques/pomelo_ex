defmodule PomeloEx.Fraud.TransactionalBlock.GetBlockListTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.TransactionalBlock.GetBlockList
  alias PomeloEx.Fraud.TransactionalBlockFixtures

  test "Success 200 - Get Block List" do
    payload = TransactionalBlockFixtures.get_block_list_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert String.starts_with?(
               url,
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/search/merchant/block?"
             )

      assert String.contains?(url, "filter[type]=id")
      assert String.contains?(url, "page[size]=10")
      assert String.contains?(url, "page[number]=0")

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: TransactionalBlockFixtures.get_block_list_response()
       }}
    end)

    {:ok, response} = GetBlockList.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
