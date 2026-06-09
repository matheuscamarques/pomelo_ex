defmodule PomeloEx.Types.Cards.Associations.Associations.SearchAssociationsType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_card_id, :string)
    field(:filter_account_id, :string)
  end
end
