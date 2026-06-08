defmodule PomeloEx.Types.Cards.Issuing.GetAffinityGroupType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:id, :string, enforce: true, null: false)
  end
end
