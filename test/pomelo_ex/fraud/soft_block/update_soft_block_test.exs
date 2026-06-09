defmodule PomeloEx.Fraud.SoftBlock.UpdateSoftBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.SoftBlock.UpdateSoftBlock
  alias PomeloEx.Fraud.SoftBlockFixtures

  test "Success 200 - Update Soft Block" do
    payload = SoftBlockFixtures.update_soft_block_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :put, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/merchant/softblock"

      sent_body = Jason.decode!(body)
      assert sent_body["merchant_name"] == "FACEBOOK*12345"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: SoftBlockFixtures.update_soft_block_response()
       }}
    end)

    {:ok, response} = UpdateSoftBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "SOFTBLOCK applied to merchant."
  end
end
