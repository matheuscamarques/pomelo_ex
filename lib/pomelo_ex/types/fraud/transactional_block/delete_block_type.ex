defmodule PomeloEx.Types.Fraud.TransactionalBlock.DeleteBlockType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:type, :string, enforce: true, null: false)
    field(:identifier, :string, enforce: true, null: false)
  end
end
