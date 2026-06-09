defmodule PomeloEx.Fraud.SoftBlock.RemoveSoftBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.SoftBlock.RemoveSoftBlock
  alias PomeloEx.Fraud.SoftBlockFixtures

  test "Success 200 - Remove Soft Block" do
    payload = SoftBlockFixtures.remove_soft_block_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :delete, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/merchant/softblock/FACEBOOK*12345"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: SoftBlockFixtures.remove_soft_block_response()
       }}
    end)

    {:ok, response} = RemoveSoftBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "SOFTBLOCK deleted for merchant"
  end
end
