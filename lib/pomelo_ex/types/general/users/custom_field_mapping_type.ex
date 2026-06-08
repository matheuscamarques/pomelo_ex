defmodule PomeloEx.Types.General.Users.CustomFieldMappingType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  @primary_key false
  typed_embedded_schema do
    field(:key, :string, enforce: true, null: false)
    field(:display_name, :string, enforce: true, null: false)
    field(:type, :string)
  end
end
