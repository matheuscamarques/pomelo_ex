defmodule PomeloEx.Fraud.SoftBlock.CreateSoftBlockTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.SoftBlock.CreateSoftBlock
  alias PomeloEx.Fraud.SoftBlockFixtures

  test "Success 200 - Create Soft Block" do
    payload = SoftBlockFixtures.create_soft_block_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/fraud/merchant/softblock"

      sent_body = Jason.decode!(body)
      assert sent_body["merchant_name"] == "FACEBOOK*12345"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: SoftBlockFixtures.create_soft_block_response()
       }}
    end)

    {:ok, response} = CreateSoftBlock.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "SOFTBLOCK applied to merchant."
  end
end
