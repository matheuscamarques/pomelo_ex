defmodule PomeloEx.Types.Cards.Processing.Transactions.NotificationsType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:event_id, :string)
    field(:event_detail, :map)
    field(:idempotency_key, :string)
  end
end
