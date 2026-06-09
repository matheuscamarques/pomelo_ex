defmodule PomeloEx.Finance.Settlements.GetLastSettlementTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Finance.Settlements.GetLastSettlement
  alias PomeloEx.Finance.SettlementsFixtures

  test "Success 200 - Get Last Settlement" do
    payload = SettlementsFixtures.get_last_settlement_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/finance/v1/settlements/latest?country=ARG"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: SettlementsFixtures.get_last_settlement_response()
       }}
    end)

    {:ok, response} = GetLastSettlement.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "set-3A6GlWtHT1Tfpb5mcMLxatRSmNv"
    assert body["data"]["status"] == "PENDING"
  end
end
