defmodule PomeloEx.Types.Cards.Issuing.CreateShipmentType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:batch_id, :string)
    field(:user_id, :string)
    field(:address, :map)
    field(:recipient, :map)
    field(:carrier, :map)
  end
end
