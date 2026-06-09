defmodule PomeloEx.Cards.SensitiveInformation.Authorization do
  @moduledoc """
  User authentication for sensitive card data access.

  Creates short-lived (15-minute) user tokens that authorize the display of sensitive
  card information (PAN, CVV, PIN) via the Pomelo secure data web page.
  """
  alias PomeloEx.Cards.SensitiveInformation.Authorization.CreateUserToken

  @doc """
  Create user token
  This endpoint lets you create a token for a specific user, which is used to display your card's secure information. Use the token obtained in the Authorization section and keep in mind that it only lasts fifteen minutes.
  """
  defdelegate create_user_token(payload), to: CreateUserToken, as: :execute
end
