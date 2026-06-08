defmodule PomeloEx.Types.Cards.Issuing.ShipmentNotificationsType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:event_id, :string)
    field(:type, :string)
    field(:data, :map)
  end
end
