defmodule PomeloEx.Cards.Credits do
  @moduledoc """
  Credit products, lines, and lending management.

  This namespace groups all credit-related operations including product definition,
  credit line management, allocations, installment plans, statements, and debt management.

  ## Sub-modules

  - `PomeloEx.Cards.Credits.CreditProduct` — Credit product configuration (V1)
  - `PomeloEx.Cards.Credits.CreditLines` — Credit line management (V1)
  - `PomeloEx.Cards.Credits.CreditLinesV2` — Credit line management (V2)
  - `PomeloEx.Cards.Credits.AvailablePlans` — Installment and refinancing plan queries
  - `PomeloEx.Cards.Credits.Allocations` — Fund allocation management
  - `PomeloEx.Cards.Credits.Statements` — Account statement queries
  - `PomeloEx.Cards.Credits.Operations` — Credit operations history
  - `PomeloEx.Cards.Credits.Hierarchies` — Organizational hierarchy management
  - `PomeloEx.Cards.Credits.DebtSaleToBanks` — Debt sale/purchase notifications
  - `PomeloEx.Cards.Credits.Webhooks` — Credit webhook notifications
  """

  def execute(payload) do
    raise "Not implemented #{__MODULE__} payload:" <> inspect(payload)
  end
end
