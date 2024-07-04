defmodule PomeloEx.General.Company do
  @moduledoc """
  Company
  The Companies API contains all the endpoints needed to manage the company bases.
  You can use it to create, update or even search for companies under certain parameters.
  """

  @doc """
  Create company
  The /companies/v1/ endpoint enables you to create a new company in our database.

  General considerations#
  Para el campo operation_country esperamos un código de 3 caracteres respetando el estándar ISO
  Here is a list of examples:

  ARG
  BRA
  CHL
  COL
  MEX
  PER

  Points to keep in mind for tax documents#
  Brazil: A CNPJ is an acceptable tax document.

  Argentina: The type of fiscal document accepted is the CUIT. Campos requeridos: legal_address, email, tradeName, legalName, phone, type, tax_condition
  """

  alias PomeloEx.General.Company.CreateCompany
  defdelegate create_company(payload), to: CreateCompany, as: :execute

  @doc """
  Search for companies
  The '/users/v1/' endpoint enables you to search for a group of users and receive a list sorted according to the parameters specified.

  Considerations#
  You may specify your filters as parameters following this pattern: filter[campo]=valor. For example: /companies/v1/?filter[status]=ACTIVE To filter an attribute for several possible values, separate the values with commas. For example: filter[status]=ACTIVE,BLOCKED

  The results are paginated and you can specify the amount of data per page and also which page to view using: page[number]=value and page[size]=value

  Sorting#
  You can specify the order of the results with certain parameters that you must send as list of strings in the sort filter type. For example: ?filter[status]=ACTIVE&sort=status

  The default sorting will be ascending. To specify a descending sorting, you must send the character '-' as a prefix of the attribute. For example: /companies/v1/?filter[status]=ACTIVE&sort=status,-tax_identification_type

  The possible sorting attributes are:

  id
  legal_name
  trade_name
  tax_identification_type
  tax_identification_value
  status
  """
  alias PomeloEx.General.Company.SearchCompanies
  defdelegate search_companies, to: SearchCompanies, as: :execute

  @doc """
  Get Company
  The /companies/v1/{id} endpoint enables you to query a company's information through its id.
  """
  alias PomeloEx.General.Company.GetCompany
  defdelegate get_company(payload), to: GetCompany, as: :execute

  @doc """
  Modify Company
  The endpoint '/companies/v1/{id}' enables you to update a company's information through its id. Updating a company is only possible if it has not been validated.

  Considerations#
  To block a company, you must send the 'status' with the value 'BLOCKED' and the value 'CLIENT_INTERNAL_REASON' in the field 'status_reason'.

  To reactivate a company that you have blocked, you will need to submit the 'status' with an 'ACTIVE' value.
  """
  alias PomeloEx.General.Company.ModifyCompany
  defdelegate modify_company(payload), to: ModifyCompany, as: :execute
end
