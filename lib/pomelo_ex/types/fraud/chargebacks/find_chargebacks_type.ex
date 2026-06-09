defmodule PomeloEx.Types.Fraud.Chargebacks.FindChargebacksType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_user_id, :string)
    field(:filter_status, :string)
    field(:filter_transaction_id, :string)
    field(:filter_created_at_from, :string)
    field(:filter_created_at_to, :string)
    field(:filter_updated_at_from, :string)
    field(:filter_updated_at_to, :string)
    field(:sort, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
  end
end
