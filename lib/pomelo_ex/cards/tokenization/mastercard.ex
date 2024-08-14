defmodule PomeloEx.Cards.Tokenization.Mastercard do
  @moduledoc """
  The following endpoints are used during the [push provisioning flow](https://docs.pomelo.la/en/docs/cards/features/tokenization/provisioning) to generate the cryptographic data that your application needs to send to the virtual wallet. Before using them, confirm with our integrations team that you have everything prepared.

  Want to know more about Tokenization integration? We provide all the details in [our documentation](https://docs.pomelo.la/en/docs/cards/features/tokenization/home).
  """
  alias PomeloEx.Cards.Tokenization.Mastercard.ProvisioningApplePay
  alias PomeloEx.Cards.Tokenization.Mastercard.ProvisioningGooglePay

  defdelegate provisioning_apple_pay(payload), to: ProvisioningApplePay, as: :execute
  defdelegate provisioning_google_pay(payload), to: ProvisioningGooglePay, as: :execute
end
