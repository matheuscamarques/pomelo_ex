defmodule PomeloEx.Types.Loyalty.PointsConfirmationNotificationType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:event_id, :string, enforce: true, null: false)
    field(:idempotency_key, :string, enforce: true, null: false)
  end
end
