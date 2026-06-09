defmodule PomeloEx.Fraud.Chargebacks.ObtainChargebackTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.Chargebacks.ObtainChargeback
  alias PomeloEx.Fraud.ChargebacksFixtures

  test "Success 200 - Obtain Chargeback" do
    payload = ChargebacksFixtures.obtain_chargeback_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/chargebacks/v2/cbk-1ab2c3d4"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ChargebacksFixtures.obtain_chargeback_response()
       }}
    end)

    {:ok, response} = ObtainChargeback.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "PENDING"
  end
end
