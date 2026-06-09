defmodule PomeloEx.Types.Cards.Credits.CreditProduct.GetProductsType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_name, :string)
    field(:filter_status, :string)
    field(:page_number, :integer)
    field(:page_size, :integer)
  end
end
