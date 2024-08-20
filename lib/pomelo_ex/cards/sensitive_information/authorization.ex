defmodule PomeloEx.Cards.SensitiveInformation.Authorization do
  @moduledoc """
  With this API you can authenticate a user to display sensitive card information.
  """

  @doc """
  Create user token
  This endpoint lets you create a token for a specific user, which is used to display your card's secure information. Use the token obtained in the Authorization section and keep in mind that it only lasts fifteen minutes.
  """
  alias PomeloEx.Cards.SensitiveInformation.Authorization.CreateUserToken

  defdelegate create_user_token(payload), to: CreateUserToken, as: :execute
end
