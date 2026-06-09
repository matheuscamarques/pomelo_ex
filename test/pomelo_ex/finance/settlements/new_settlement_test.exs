defmodule PomeloEx.Finance.Settlements.NewSettlementTest do
  use ExUnit.Case

  alias PomeloEx.Finance.Settlements.NewSettlement
  alias PomeloEx.Finance.SettlementsFixtures

  test "Success 200 - New Settlement Webhook" do
    payload = SettlementsFixtures.new_settlement_request()

    {:ok, response} = NewSettlement.execute(payload)

    assert response.event_id == "finance_new_settlement"
    assert response.settlement_id == "set-3A6GlWtHT1Tfpb5mcMLxatRSmNv"
    assert response.country == "ARG"
  end
end
