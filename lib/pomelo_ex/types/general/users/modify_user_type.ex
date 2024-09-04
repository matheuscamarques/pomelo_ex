defmodule PomeloEx.Types.General.Users.ModifyUserType do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Users.ModifyUserLegalAddressType

  @enforce_keys [:id]
  @derive Jason.Encoder
  typed_embedded_schema do
    field(:name, :string)
    field(:surname, :string)
    field(:identification_type, :string)
    field(:identification_value, :string)
    field(:birthdate, :string)
    field(:gender, :string)
    field(:email, :string)
    field(:phone, :string)
    field(:tax_identification_type, :string)
    field(:tax_identification_value, :string)
    field(:nationality, :string)
    field(:tax_condition, :string)
    field(:operation_country, :string)
    field(:status, :string)
    field(:status_reason, :string)
    embeds_one(:legal_address, ModifyUserLegalAddressType)
  end
end
