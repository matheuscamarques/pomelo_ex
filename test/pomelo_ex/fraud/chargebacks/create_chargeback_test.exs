defmodule PomeloEx.Fraud.Chargebacks.CreateChargebackTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.Chargebacks.CreateChargeback
  alias PomeloEx.Fraud.ChargebacksFixtures

  test "Success 201 - Create Chargeback" do
    payload = ChargebacksFixtures.create_chargeback_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/chargebacks/v2"

      sent_body = Jason.decode!(body)
      assert sent_body["dispute_type"] == "CONTROVERSY"
      assert sent_body["reason"] == "VIRTUAL_PAYMENT"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: ChargebacksFixtures.create_chargeback_response()
       }}
    end)

    {:ok, response} = CreateChargeback.execute(payload)

    body = Jason.decode!(response.body)
    assert body["status"] == "PENDING"
  end
end
