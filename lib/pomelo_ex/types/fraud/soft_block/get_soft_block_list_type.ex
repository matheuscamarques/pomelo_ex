defmodule PomeloEx.Types.Fraud.SoftBlock.GetSoftBlockListType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:page_size, :integer)
    field(:page_number, :integer)
  end
end
