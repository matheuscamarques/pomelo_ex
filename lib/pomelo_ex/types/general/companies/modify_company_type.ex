defmodule PomeloEx.Types.General.Companies.ModifyCompanyType do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Companies.ModifyCompanyLegalAddressType

  @enforce_keys [:id]
  @derive Jason.Encoder
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:legal_name, :string)
    field(:trade_name, :string)
    field(:tax_identification_type, :string)
    field(:tax_identification_value, :string)
    field(:email, :string)
    field(:phone, :string)
    field(:type, :string)
    field(:tax_condition, :string)
    field(:operation_country, :string)
    field(:status, :string)
    field(:status_reason, :string)
    embeds_one(:legal_address, ModifyCompanyLegalAddressType)
  end
end
