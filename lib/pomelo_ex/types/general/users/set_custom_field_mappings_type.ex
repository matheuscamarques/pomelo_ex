defmodule PomeloEx.Types.General.Users.SetCustomFieldMappingsType do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Users.CustomFieldMappingType

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    embeds_many(:mappings, CustomFieldMappingType)
  end
end
