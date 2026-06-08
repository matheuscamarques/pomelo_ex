defmodule PomeloEx.Types.Cards.Processing.OnUs.ReverseTransactionByExternalIdType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:transaction, :map)
  end
end
