defmodule PomeloEx.Types.Cards.Processing.OnUs.PresentTransactionByExternalIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:type, :string)
    field(:original_transaction_id, :string)
    field(:external_presentment_id, :string)
    field(:reconciliation_date, :string)
    field(:amounts, :map)
    field(:installments, :map)
  end
end
