defmodule PomeloEx.Types.Cards.Issuing.CreateCardType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:user_id, :string)
    field(:affinity_group_id, :string)
    field(:card_type, :string)
  end
end
