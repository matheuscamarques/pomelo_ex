defmodule PomeloEx.Types.Cards.Processing.OnUs.PresentTransactionByPomeloIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:original_presentment_id, :string, enforce: true, null: false)
    field(:external_presentment_id, :string)
    field(:reconciliation_date, :string)
    field(:amounts, :map)
  end
end
