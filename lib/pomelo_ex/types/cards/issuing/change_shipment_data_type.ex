defmodule PomeloEx.Types.Cards.Issuing.ChangeShipmentDataType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:shipment_id, :string, enforce: true, null: false)
    field(:street_name, :string)
    field(:street_number, :string)
    field(:zip_code, :string)
    field(:city, :string)
    field(:region, :string)
    field(:country, :string)
    field(:neighborhood, :string)
    field(:additional_info, :string)
  end
end
