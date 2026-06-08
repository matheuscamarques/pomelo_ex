defmodule PomeloEx.Types.Cards.SensitiveInformation.Handling.ActivateCardType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:card_id, :string, enforce: true, null: false)
    field(:auth, :string, enforce: true, null: false)
    field(:locale, :string)
    field(:styles, :string)
    field(:styles_string, :string)
    field(:success_link, :string)
  end
end
