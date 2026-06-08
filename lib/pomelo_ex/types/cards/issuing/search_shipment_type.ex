defmodule PomeloEx.Types.Cards.Issuing.SearchShipmentType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_shipment_type, :string)
    field(:filter_status, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
    field(:sort, {:array, :string})
  end
end
