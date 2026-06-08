defmodule PomeloEx.Types.Cards.Processing.OnUs.AuthorizeType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:transaction, :map)
    field(:pos, :map)
    field(:merchant, :map)
    field(:acquirer, :map)
    field(:installments, :map)
    field(:instrument, :map)
    field(:amounts, :map)
  end
end
