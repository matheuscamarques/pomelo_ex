defmodule PomeloEx.Identity.Webhooks do
  @moduledoc """
  Webhook notifications for identity validation sessions.

  Pomelo sends HTTP notifications when KYC/KYB sessions are processed or completed.
  These notifications include a digital signature for verification.

  ## Digital signature verification

  Each webhook request includes the following headers:

  - `X-Api-Key` — Identifies which api-secret to use for verification
  - `X-Signature` — HMAC-SHA256 digital signature of the request
  - `X-Timestamp` — Unix epoch timestamp of when the request was signed
  - `X-Endpoint` — The endpoint path used in signature generation

  ### Verifying the signature

      request_signature = request.headers["x-signature"]
      signature_data = request.headers["x-timestamp"] <> request.headers["x-endpoint"] <> request.body
      client_secret = Base.decode64!(api_secret)
      recreated_signature = :hmac.sign(:sha256, client_secret, signature_data)
      valid = request_signature == "hmac-sha256 " <> Base.encode16(recreated_signature, case: :lower)
  """
  alias PomeloEx.Identity.Webhooks.RequiredFileNotification
  alias PomeloEx.Identity.Webhooks.ValidationSessionNotifications

  @doc """
  Validation session notifications
  You must inform us of this endpoint to receive notifications of an identity validation session. You must return a type 2xx HTTP code so that the notification is not sent again Otherwise, we will send it again.
  """
  defdelegate validation_session_notifications(payload),
    to: ValidationSessionNotifications,
    as: :execute

  @doc """
  Notification of required file
  Please provide us with this endpoint to receive notifications for required files. You must return us an HTTP code in the 2xx range to prevent us from resending the notification. Otherwise, we will send it again.
  """
  defdelegate required_file_notification(payload), to: RequiredFileNotification, as: :execute
end
