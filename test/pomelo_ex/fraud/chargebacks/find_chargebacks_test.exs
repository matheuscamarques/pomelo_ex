defmodule PomeloEx.Fraud.Chargebacks.FindChargebacksTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.Chargebacks.FindChargebacks
  alias PomeloEx.Fraud.ChargebacksFixtures

  test "Success 200 - Find Chargebacks" do
    payload = ChargebacksFixtures.find_chargebacks_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/chargebacks/v2/?filter[status]=PENDING"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: ChargebacksFixtures.find_chargebacks_response()
       }}
    end)

    {:ok, response} = FindChargebacks.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
