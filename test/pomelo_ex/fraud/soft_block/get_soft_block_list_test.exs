defmodule PomeloEx.Fraud.SoftBlock.GetSoftBlockListTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.SoftBlock.GetSoftBlockList
  alias PomeloEx.Fraud.SoftBlockFixtures

  test "Success 200 - Get Soft Block List" do
    payload = SoftBlockFixtures.get_soft_block_list_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert String.starts_with?(url,
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/search/merchant/softblock?"
      )

      assert String.contains?(url, "page[size]=10")
      assert String.contains?(url, "page[number]=0")

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: SoftBlockFixtures.get_soft_block_list_response()
       }}
    end)

    {:ok, response} = GetSoftBlockList.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
