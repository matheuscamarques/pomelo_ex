defmodule PomeloEx.Types.Fraud.SoftBlock.RemoveSoftBlockType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:merchant_name, :string, enforce: true, null: false)
  end
end
