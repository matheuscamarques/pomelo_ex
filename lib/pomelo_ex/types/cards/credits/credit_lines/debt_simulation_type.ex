defmodule PomeloEx.Types.Cards.Credits.CreditLines.DebtSimulationType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
    field(:transaction_ids, :string)
  end
end
