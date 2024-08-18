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

  @doc """
  Notifications of processed transactions
  You must inform us of this endpoint to receive notifications of processed transactions. You must return a type 2xx HTTP code so that the notification is not sent again. Otherwise, we will send it again.
  """
  alias PomeloEx.Cards.Credits.Webhooks.ProcessedTransactionsNotifications

  defdelegate processed_transactions_notifications(payload),
    to: ProcessedTransactionsNotifications,
    as: :execute

  @doc """
  Reversed transaction notifications
  You must inform us of this endpoint to receive notifications of processed transactions. You must return a type 2xx HTTP code so that the notification is not sent again. Otherwise, we will send it again.
  """
  alias PomeloEx.Cards.Credits.Webhooks.ReversedTransactionsNotifications

  defdelegate reversed_transactions_notifications(payload),
    to: ReversedTransactionsNotifications,
    as: :execute

  @doc """
  Credit line pause/unpause notifications
  You must inform us of this endpoint to receive notifications of processed transactions. You must return a type 2xx HTTP code so that the notification is not sent again. Otherwise, we will send it again.
  """
  alias PomeloEx.Cards.Credits.Webhooks.CreditLinePauseUnpauseNotifications

  defdelegate credit_line_pause_unpause_notifications(payload),
    to: CreditLinePauseUnpauseNotifications,
    as: :execute

  @doc """
  Notifications of entry or exit from arrears of a user
  You must indicate this endpoint to receive notifications of a user entering or leaving arrears. You must return an HTTP code of the type 2xx so that we do not send the notification again. Otherwise, we will send it again.
  """
  alias PomeloEx.Cards.Credits.Webhooks.EntryExitFromArrearsUserNotifications

  defdelegate entry_exit_from_arrears_user_notifications(payload),
    to: EntryExitFromArrearsUserNotifications,
    as: :execute

  @doc """
  Notifications of created summaries
  You will have to indicate this endpoint to receive the notifications of created summaries. You must return a type 2xx HTTP code so that the notification is not sent again Otherwise, we will send it again.
  """
  alias PomeloEx.Cards.Credits.Webhooks.CreatedSummariesNotifications

  defdelegate created_summaries_notifications(payload),
    to: CreatedSummariesNotifications,
    as: :execute
end
