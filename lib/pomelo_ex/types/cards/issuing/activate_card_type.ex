defmodule PomeloEx.Types.Cards.Issuing.ActivateCardType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string)
    field(:pin, :string)
  end
end
