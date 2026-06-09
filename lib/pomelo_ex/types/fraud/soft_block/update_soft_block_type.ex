defmodule PomeloEx.Types.Fraud.SoftBlock.UpdateSoftBlockType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:merchant_name, :string, enforce: true, null: false)
    field(:expiration_date, :string)
  end
end
