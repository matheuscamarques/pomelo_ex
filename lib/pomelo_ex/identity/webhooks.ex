defmodule PomeloEx.Identity.Webhooks do
  @moduledoc """
  This service notifies you when an identity validation session is being processed or completed.

  Digital signature request verification process#
  We send a set of HTTP headers to authenticate it along with the notification.

  The HTTP headers we send are:

    - X-Api-Key : this header allows you to identify which api-secret you have to use in the event that multiple api-key and api-secret pairs have been configured.

    - X-Signature : this header contains the digital signature (timestamp + endpoint + body) that must be verified to ensure the integrity of the request. If the signature does not match, the order must be rejected.

    - X-Timestamp : this header contains the moment the order was signed in unix-epoch format so that you can verify that the signature has not expired.

    - X-Endpoint : the endpoint to which the request is made and used to generate the signature. Use this header to regenerate the signature to be validated, compare it with the endpoint of your service and verify that they match.

  The digital signature is an HMAC-SHA256 code constructed using the 'api-secret' and a series of bytes, composed of a timestamp concatenation, endpoint and request body coded in UTF-8.

  The following is a pseudo-code to verify that the digital signature of a request is legitimate:

  requestSignature = request.headers['x-signature']

  signatureData = encode(request.headers['x-timestamp'] + request.headers['x-endpoint'] + request.body , 'UTF-8')

  clientApiSecretDecoded = base64.b64decode(apiSecret)

  recreatedSignature = hmac(clientApiSecretDecoded, signatureData, 'SHA256')

  validSignature = requestSignature == 'hmac-sha256 ' + recreatedSignature
  """

  alias PomeloEx.Identity.Webhooks.RequiredFileNotification
  alias PomeloEx.Identity.Webhooks.ValidationSessionNotifications

  defdelegate required_file_notification(payload), to: RequiredFileNotification, as: :execute

  defdelegate validation_session_notifications(payload),
    to: ValidationSessionNotifications,
    as: :execute
end
