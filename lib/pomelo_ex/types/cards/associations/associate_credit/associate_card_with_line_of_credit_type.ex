defmodule PomeloEx.Types.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCreditType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:card_id, :string, enforce: true, null: false)
    field(:credit_line_id, :string, enforce: true, null: false)
  end
end
