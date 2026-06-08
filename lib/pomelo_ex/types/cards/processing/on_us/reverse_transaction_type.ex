defmodule PomeloEx.Types.Cards.Processing.OnUs.ReverseTransactionType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:original_transaction_id, :string, enforce: true, null: false)
    field(:transaction, :map)
  end
end
