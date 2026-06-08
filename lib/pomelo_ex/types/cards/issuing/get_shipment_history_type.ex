defmodule PomeloEx.Types.Cards.Issuing.GetShipmentHistoryType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:shipment_id, :string, enforce: true, null: false)
  end
end
