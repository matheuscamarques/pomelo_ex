defmodule PomeloEx.Types.Cards.Issuing.UpdateCardShippingType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:id, :string, enforce: true, null: false)
    field(:street_name, :string)
    field(:street_number, :string)
    field(:zip_code, :string)
  end
end
