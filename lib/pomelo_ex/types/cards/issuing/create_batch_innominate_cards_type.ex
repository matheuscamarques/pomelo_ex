defmodule PomeloEx.Types.Cards.Issuing.CreateBatchInnominateCardsType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:affinity_group_id, :string)
    field(:quantity, :integer)
  end
end
