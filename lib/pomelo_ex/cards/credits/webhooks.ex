defmodule PomeloEx.Cards.Credits.Webhooks do
  @moduledoc """
  This service will be in charge of notifying you of events related to credit cards.

  Digital signature request verification process#
  We send a set of HTTP headers to authenticate it along with the notification.

  The HTTP headers we send are:

  x-api-key : this header allows you to identify which api-secret you have to use in the event that multiple api-key and api-secret pairs have been configured.

  x-signature : This header contains the digital signature (body + timestamp + endpoint) that must be verified to ensure request integrity. If the signature does not match, reject the order.

  x-timestamp : this header contains the moment the order was signed in unix-epoch format so that you can verify that the signature has not expired.

  x-endpoint : the endpoint to which the request is made and used to generate the signature. Use this header to regenerate the signature to be validated, compare it with the endpoint of your service and verify that they match.

  The digital signature is an HMAC-SHA256 code constructed using the 'api-secret' and a series of bytes, composed of a timestamp concatenation, endpoint and request body coded in UTF-8.

  The following is a pseudo-code to verify that the digital signature of a request is legitimate:

  requestSignature = request.headers['x-signature']
  signatureData = encode(request.headers['x-timestamp'] + request.headers['x-endpoint'] + request.body , 'UTF-8')
  recreatedSignature = hmac(apiSecret, signatureData, 'SHA256')
  validSignature = requestSignature == recreatedSignature
  """

  alias PomeloEx.Cards.Credits.Webhooks.CreatedSummariesNotifications
  alias PomeloEx.Cards.Credits.Webhooks.CreditLinePauseUnpauseNotifications
  alias PomeloEx.Cards.Credits.Webhooks.EntryExitFromArrearsUserNotifications
  alias PomeloEx.Cards.Credits.Webhooks.ProcessedTransactionsNotifications
  alias PomeloEx.Cards.Credits.Webhooks.ReversedTransactionsNotifications

  defdelegate created_summaries_notifications(payload),
    to: CreatedSummariesNotifications,
    as: :execute

  defdelegate credit_line_pause_unpause_notifications(payload),
    to: CreditLinePauseUnpauseNotifications,
    as: :execute

  defdelegate entry_exit_from_arrears_user_notifications(payload),
    to: EntryExitFromArrearsUserNotifications,
    as: :execute

  defdelegate processed_transactions_notifications(payload),
    to: ProcessedTransactionsNotifications,
    as: :execute

  defdelegate reversed_transactions_notifications(payload),
    to: ReversedTransactionsNotifications,
    as: :execute
end
