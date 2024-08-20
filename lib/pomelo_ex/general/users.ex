defmodule PomeloEx.General.Users do
  @moduledoc """
  Users
  The Users API contains all the endpoints needed to manage the user bases. You can use it to create, update or even search for users within certain parameters.
  """
  alias PomeloEx.General.Users.CreateUser
  alias PomeloEx.General.Users.GetUser
  alias PomeloEx.General.Users.ModifyUser
  alias PomeloEx.General.Users.SearchUser

  @doc """
  Create user
  The /users/v1/ endpoint allows you to create a new user in our database.

  The number of parameters required to create a user varies depending on the product you have signed up for, but we will always ask you for email and operation_country.

  General considerations#
  For the 'operation_country' and 'nationality' fields we expect a 3-character code respecting the ISO 3166 alpha-3 standard.
  Here is a list of examples:

  ARG
  BRA
  MEX
  COL
  PER
  CHL
  Considerations for repeat users#
  Each user must have a unique email, and the combination of identity document type and value must also be unique.

  Considerations on the identity documents#
  For Argentina
  Acceptable identity documents are as follows:

  DNI
  LE
  LC
  CI
  PASSPORT
  In the case of the DNI, we will validate that its extension is 7 or 8 characters.

  The accepted tax document type is:

  CUIL
  In the case of CUIL, we will validate that the first two digits are 20, 23, 24, 27, 30, 33 or 34 and its length is exactly 11 characters

  For Brazil
  Acceptable identity documents are as follows:

  RG
  CNH
  The accepted tax document type is:

  CPF
  In the case of CPF, we will validate that its extension is exactly 11 characters.

  For Mexico
  Acceptable identity documents are as follows:

  INE
  PASSPORT
  The tax document is not required, but the accepted type is:

  RFC
  En el caso de INE, validaremos que su extensión sea de 12 o 13 caracteres.

  For Colombia
  Acceptable identity documents are as follows:

  CC
  CE
  PPT
  PASSPORT
  For CC we will validate that it has between 5 and 11 characters.

  For CE we will validate that it has between 6 and 7 characters.

  Para PPT validaremos que su extensión sea entre 1 y 8 caracteres.

  The tax document is not required, but the accepted type is:

  NIT
  In the case of the NIT, we will validate that its extension is exactly 10 characters.

  For Peru
  Acceptable identity documents are as follows:

  DNI
  CE
  PASSPORT
  For the DNI, we will check that its ID number is exactly eight characters long and all numeric

  For the Alien Registration Card, we will check that its ID number is up to 12 alphanumeric characters long

  The accepted tax document type is:

  RUC
  In the case of RUC, we will validate that the first two digits are 10, 15 or 17 and its extension is 11 digits.

  For Chile
  Acceptable identity documents are as follows:

  CI
  In the case of the CI, we will validate that its extension is 8 or 11 characters.

  The accepted tax document type is:

  RUT
  In the case of the RUT, we will validate that its extension is exactly 9 characters, 8 digits and a verifying character, which can be a digit or a letter k.

  Legal address considerations#
  For Argentina
  If you operate in Argentina, the user’s legal address must be from one of these provinces:

  Buenos Aires
  Catamarca
  Chaco
  Chubut
  Ciudad Autónoma de Buenos Aires
  Corrientes
  Córdoba
  Entre Ríos
  Formosa
  Jujuy
  La Pampa
  La Rioja
  Mendoza
  Misiones
  Neuquén
  Río Negro
  Salta
  San Juan
  San Luis
  Santa Cruz
  Santa Fe
  Santiago del Estero
  Tierra del Fuego
  Tucumán
  For Brazil
  If you operate in Brazil, you must fill out the zipcode field with valid data, as we use it to determine the user's legal address.

  For Mexico
  If you operate in Mexico, there are no special requirements regarding the user's legal address fields.

  For Chile
  In case the operating country is Chile, there are no special requirements regarding the user's legal address fields.
  """
  defdelegate create_user(payload), to: CreateUser, as: :execute

  @doc """
  Search user
  The /users/v1/ endpoint allows you to search for a group of users and receive a list sorted according to the parameters specified.

  Considerations#
  Filters must be specified as parameters following this pattern: filter[campo]=valor. For example: /users/v1/?filter[status]=ACTIVE To filter an attribute for several possible values, separate the values with commas. Let's look at an example: filter[status]=ACTIVE,BLOCKED

  The results are paginated and you can specify the amount of data per page and also which page to view using: page[number]=value and page[size]=value

  Sorting#
  You can specify the order of the results with certain parameters that you must send as list of strings in the sort filter type. For example: ?filter[status]=ACTIVE&sort=status,gender

  The default sorting will be ascending. To specify a descending sorting, you must send the character '-' as a prefix of the attribute. For example: /users/v1/?filter[status]=ACTIVE&sort=status,-gender

  The possible sorting attributes are:

  id
  gender
  identification_type
  identification_value
  status
  If a parameter is incorrect or misspelled, it will return an error.
  """
  defdelegate search_user(payload), to: SearchUser, as: :execute

  @doc """
  Get user
  The /users/v1/{id} endpoint allows you to query a user’s information through their user_id.
  """
  defdelegate get_user(payload), to: GetUser, as: :execute

  @doc """
  Modify user
  The endpoint /users/v1/{id} allows you to update a user’s information with their ID.

  Considerations#
  To block a user you must send the status with the value BLOCKED and the value CLIENT_INTERNAL_REASON in the status_reason field.

  To reactivate a user you have blocked, you will need to send status with value ACTIVE.

  Considerations for repeat users
  Each user must have a unique email, and the combination of identity document type and value must also be unique.

  Considerations on the identity documents#
  For Argentina
  Acceptable identity documents are as follows:

  DNI
  LE
  LC
  CI
  PASSPORT
  In the case of the DNI, we will validate that its extension is 7 or 8 characters.

  The accepted tax document type is:

  CUIL
  In the case of CUIL, we will validate that the first two digits are 20, 23, 24, 27, 30, 33 or 34 and its length is exactly 11 characters

  For Brazil
  Acceptable identity documents are as follows:

  RG
  CNH
  The accepted tax document type is:

  CPF
  In the case of CPF, we will validate that its extension is exactly 11 characters.

  For Mexico
  Acceptable identity documents are as follows:

  INE
  PASSPORT
  The tax document is not required, but the accepted type is:

  RFC
  For Colombia
  Acceptable identity documents are as follows:

  CC
  CE
  PPT
  PASSPORT
  For CC we will validate that it has between 5 and 11 characters.

  For CE we will validate that it has between 6 and 7 characters.

  Para PPT validaremos que su extensión sea entre 1 y 8 caracteres.

  The tax document is not required, but the accepted type is:

  NIT
  In the case of the NIT, we will validate that its extension is exactly 10 characters.

  For Peru
  Acceptable identity documents are as follows:

  DNI
  CE
  PASSPORT
  For the DNI, we will check that its ID number is exactly eight characters long and all numeric

  For the Alien Registration Card, we will check that its ID number is up to 12 alphanumeric characters long

  The accepted tax document type is:

  RUC
  In the case of RUC, we will validate that the first two digits are 10, 15 or 17 and its extension is 11 digits.

  For Chile
  Acceptable identity documents are as follows:

  CI
  In the case of the CI, we will validate that its extension is 8 or 11 characters.

  The accepted tax document type is:

  RUT
  In the case of the RUT, we will validate that its extension is exactly 9 characters, 8 digits and a verifying character, which can be a digit or a letter k.

  Legal address considerations#
  For Argentina
  If you operate in Argentina, the user’s legal address must be from one of these provinces:

  Buenos Aires
  Catamarca
  Chaco
  Chubut
  Ciudad Autónoma de Buenos Aires
  Corrientes
  Córdoba
  Entre Ríos
  Formosa
  Jujuy
  La Pampa
  La Rioja
  Mendoza
  Misiones
  Neuquén
  Río Negro
  Salta
  San Juan
  San Luis
  Santa Cruz
  Santa Fe
  Santiago del Estero
  Tierra del Fuego
  Tucumán
  For Brazil
  If you operate in Brazil, you must fill out the zipcode field with valid data, as we use it to determine the user's legal address.

  For Mexico
  If you operate in Mexico, there are no special requirements regarding the user's legal address fields.

  For Chile
  In case the operating country is Chile, there are no special requirements regarding the user's legal address fields.
  """
  defdelegate modify_user(payload), to: ModifyUser, as: :execute
end
