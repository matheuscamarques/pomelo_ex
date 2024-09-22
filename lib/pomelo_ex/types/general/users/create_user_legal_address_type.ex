defmodule PomeloEx.Types.General.Users.CreateUserLegalAddressType do
  @moduledoc false
  use TypedEctoSchema

  @derive Jason.Encoder
  typed_embedded_schema do
    field(:street_name, :string, enforce: true, null: false)
    field(:street_number, :string, enforce: true, null: false)
    field(:floor, :string)
    field(:apartment, :string)
    field(:zip_code, :string, enforce: true, null: false)
    field(:neighborhood, :string)
    field(:city, :string, enforce: true, null: false)
    field(:region, :string, enforce: true, null: false)
    field(:additional_info, :string)
    field(:country, :string, enforce: true, null: false)
  end
end
