defmodule PomeloEx.Cards.Tokenization.Mastercard do
  @moduledoc """
  The following endpoints are used during the [push provisioning flow](https://docs.pomelo.la/en/docs/cards/features/tokenization/provisioning) to generate the cryptographic data that your application needs to send to the virtual wallet. Before using them, confirm with our integrations team that you have everything prepared.

  Want to know more about Tokenization integration? We provide all the details in [our documentation](https://docs.pomelo.la/en/docs/cards/features/tokenization/home).
  """

  @doc """
  Provisioning Mastercard in Apple Pay
  Use the /token-provisioning/mastercard/apple-pay endpoint to share the information that Apple sent you with us. We will verify it and return the cryptographic data to you.

  Considerations#
  The nonce, nonce_signature values and the certificate chain are generated by Apple.
  """
  alias PomeloEx.Cards.Tokenization.Mastercard.ProvisioningApplePay
  defdelegate provisioning_apple_pay(payload), to: ProvisioningApplePay, as: :execute

  @doc """
  Provisioning Mastercard in Google Pay
  Use the /token-provisioning/mastercard/google-pay endpoint to share the information that Google sent you with us. We will verify it and return the cryptographic data to you.
  """
  alias PomeloEx.Cards.Tokenization.Mastercard.ProvisioningGooglePay
  defdelegate provisioning_google_pay(payload), to: ProvisioningGooglePay, as: :execute
end
