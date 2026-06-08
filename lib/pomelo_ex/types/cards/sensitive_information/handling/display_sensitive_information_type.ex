defmodule PomeloEx.Types.Cards.SensitiveInformation.Handling.DisplaySensitiveInformationType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:card_id, :string, enforce: true, null: false)
    field(:auth, :string, enforce: true, null: false)
    field(:layout, :string)
    field(:styles, :string)
    field(:styles_string, :string)
    field(:locale, :string)
    field(:field_list, {:array, :string})
  end
end
