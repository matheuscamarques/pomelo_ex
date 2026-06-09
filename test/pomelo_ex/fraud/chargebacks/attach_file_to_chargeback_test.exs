defmodule PomeloEx.Fraud.Chargebacks.AttachFileToChargebackTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.Chargebacks.AttachFileToChargeback
  alias PomeloEx.Fraud.ChargebacksFixtures

  test "Success 200 - Attach File to Chargeback" do
    payload = ChargebacksFixtures.attach_file_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/chargebacks/v2/cbk-1ab2c3d4/attachments"

      sent_body = Jason.decode!(body)
      assert sent_body["fileUpload"] == "base64_encoded_file_content"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: ChargebacksFixtures.attach_file_response()
       }}
    end)

    {:ok, response} = AttachFileToChargeback.execute(payload)

    body = Jason.decode!(response.body)
    assert body["error"] == false
  end
end
