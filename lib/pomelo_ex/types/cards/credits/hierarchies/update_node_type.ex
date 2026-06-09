defmodule PomeloEx.Types.Cards.Credits.Hierarchies.UpdateNodeType do
  @moduledoc false
  use TypedEctoSchema
  @primary_key false

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:hierarchy_id, :string, enforce: true, null: false)
    field(:node_id, :string, enforce: true, null: false)
    field(:body, :map, enforce: true, null: false)
  end
end
