defmodule PomeloEx.Cards.SensitiveInformation.Authorization do
  @moduledoc """
  With this API you can authenticate a user to display sensitive card information.
  """

  alias PomeloEx.Cards.SensitiveInformation.Authorization.CreateUserToken

  defdelegate create_user_token(payload), to: CreateUserToken, as: :execute
end
