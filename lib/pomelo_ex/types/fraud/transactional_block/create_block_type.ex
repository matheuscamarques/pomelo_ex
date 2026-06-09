defmodule PomeloEx.Types.Fraud.TransactionalBlock.CreateBlockType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:type, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
