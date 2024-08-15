defmodule PomeloEx.Cards.SensitiveInformation.Handling do
  @moduledoc """
  Integration Flow#
  To display sensitive information or activated your users' cards, follow these steps:

  1. Ask us for an end user token with the token you obtained in 'Authorization'. [See documentation](https://developers.pomelo.la/en/api-reference)
  2. Use this new token as a query parameter embedding the Pomelo website in your UI.
  3. Set the styles you want and the required parameters.
  """

  alias PomeloEx.Cards.SensitiveInformation.Handling.ActivateCard
  alias PomeloEx.Cards.SensitiveInformation.Handling.DisplaySensitiveInformation

  defdelegate activate_card(payload), to: ActivateCard, as: :execute

  defdelegate display_sensitive_information(payload),
    to: DisplaySensitiveInformation,
    as: :execute
end
