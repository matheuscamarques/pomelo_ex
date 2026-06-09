defmodule PomeloEx.Finance.Settlements.GetBalancesTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Finance.Settlements.GetBalances
  alias PomeloEx.Finance.SettlementsFixtures

  test "Success 200 - Get Balances" do
    payload = SettlementsFixtures.get_balances_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/finance/v1/balances?country=ARG"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: SettlementsFixtures.get_balances_response()
       }}
    end)

    {:ok, response} = GetBalances.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["balances"] |> List.first() |> Map.fetch!("currency") == "ARS"
  end
end
