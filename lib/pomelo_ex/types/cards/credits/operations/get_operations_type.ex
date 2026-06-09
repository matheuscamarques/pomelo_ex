defmodule PomeloEx.Types.Cards.Credits.Operations.GetOperationsType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_credit_line_id, :string)
    field(:filter_type, :string)
    field(:filter_status, :string)
    field(:filter_created_from, :string)
    field(:filter_created_until, :string)
    field(:page_number, :integer)
    field(:page_size, :integer)
    field(:sort, :string)
  end
end
