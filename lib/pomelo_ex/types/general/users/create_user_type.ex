defmodule PomeloEx.Types.General.Users.CreateUserType do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Users.CreateUserLegalAddressType

  @derive Jason.Encoder
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:name, :string)
    field(:surname, :string)
    field(:identification_type, :string)
    field(:identification_value, :string)
    field(:birthdate, :string)
    field(:gender, :string)
    field(:email, :string, enforce: true, null: false)
    field(:phone, :string)
    field(:tax_identification_type, :string)
    field(:tax_identification_value, :string)
    field(:nationality, :string)
    field(:tax_condition, :string)
    field(:operation_country, :string, enforce: true, null: false)
    embeds_one(:legal_address, CreateUserLegalAddressType)
  end
end
