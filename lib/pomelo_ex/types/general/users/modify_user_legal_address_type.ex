defmodule PomeloEx.Types.General.Users.ModifyUserLegalAddressType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  typed_embedded_schema do
    field(:street_name, :string)
    field(:street_number, :string)
    field(:floor, :string)
    field(:apartment, :string)
    field(:zip_code, :string)
    field(:neighborhood, :string)
    field(:city, :string)
    field(:region, :string)
    field(:additional_info, :string)
    field(:country, :string)
  end
end
