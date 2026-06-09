defmodule PomeloEx.Fraud.Chargebacks.ChargebackWebhookNotification do
  @moduledoc """
  Webhook handler for chargeback notifications.

  Configure your endpoint at `POST https://<your-server>/chargebacks` to receive
  notifications when a chargeback is modified. Headers include:
  - `X-Api-Key`: identifies which api-secret to use for signature verification
  - `X-Signature`: HMAC-SHA256 digital signature
  - `X-Timestamp`: unix-epoch timestamp
  - `X-Endpoint`: the endpoint to which the request is made

  You must respond with a 2xx HTTP status code, otherwise the notification will be resent.
  """

  @doc """
  Process a chargeback notification.

  Returns `{:ok, %{status: 200}}` on success.
  """
  def execute(_payload) do
    {:ok, %{status: 200}}
  end
end
