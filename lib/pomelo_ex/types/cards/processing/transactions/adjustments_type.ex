defmodule PomeloEx.Types.Cards.Processing.Transactions.AdjustmentsType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:type, :string, enforce: true, null: false)
    field(:transaction, :map)
    field(:merchant, :map)
    field(:card, :map)
    field(:installments, :map)
    field(:user, :map)
    field(:amount, :map)
  end
end
