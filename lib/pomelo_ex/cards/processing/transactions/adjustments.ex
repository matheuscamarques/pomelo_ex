defmodule PomeloEx.Cards.Processing.Transactions.Adjustments do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Transactions.AdjustmentsType

  def execute(%AdjustmentsType{} = payload) do
    {:ok, payload}
  end
end
