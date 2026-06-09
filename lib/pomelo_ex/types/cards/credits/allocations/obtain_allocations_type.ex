defmodule PomeloEx.Types.Cards.Credits.Allocations.ObtainAllocationsType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:filter_credit_line_id, :string, enforce: true, null: false)
  end
end
