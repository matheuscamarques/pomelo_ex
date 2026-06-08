defmodule PomeloEx.Types.Cards.Issuing.CreateMultipleBatchInnominateCardsType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:batches, {:array, :map})
  end
end
