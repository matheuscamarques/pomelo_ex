defmodule PomeloEx.Types.General.Companies.CreateCompanyType do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Companies.CreateCompanyLegalAddressType

  @derive Jason.Encoder
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:legal_name, :string)
    field(:trade_name, :string)
    field(:tax_identification_type, :string)
    field(:tax_identification_value, :string)
    field(:email, :string, enforce: true, null: false)
    field(:phone, :string)
    field(:type, :string)
    field(:tax_condition, :string)
    field(:operation_country, :string, enforce: true, null: false)
    embeds_one(:legal_address, CreateCompanyLegalAddressType)
  end
end
