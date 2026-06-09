defmodule PomeloEx.Finance.Settlements.NewSettlement do
  @moduledoc false

  alias PomeloEx.Types.Finance.Settlements.NewSettlementType

  def execute(%NewSettlementType{} = payload) do
    {:ok, payload}
  end
end
