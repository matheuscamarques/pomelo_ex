defmodule PomeloEx.Types.Fraud.Chargebacks.AttachFileToChargebackType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:chargeback_id, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
