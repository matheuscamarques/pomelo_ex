defmodule PomeloEx.Cards.Processing do
  @moduledoc """
  Transaction processing and authorization.

  This namespace groups all transaction processing operations:
  - `PomeloEx.Cards.Processing.OnUs` — On-us (same-issuer) transaction processing
  - `PomeloEx.Cards.Processing.Summaries` — Tax calculation and retrieval for statements
  - `PomeloEx.Cards.Processing.Transactions` — Authorization, adjustments, and notifications
  """

  def execute(payload) do
    raise "Not implemented #{__MODULE__} payload:" <> inspect(payload)
  end
end
