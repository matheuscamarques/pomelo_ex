defmodule PomeloEx.Types.Fraud.TransactionalBlock.GetBlockListType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:type, :string, enforce: true, null: false)
    field(:filter_type, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
  end
end
