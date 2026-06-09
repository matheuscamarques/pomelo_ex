defmodule PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsByCreditLineType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_credit_line_id, :string, enforce: true, null: false)
  end
end
