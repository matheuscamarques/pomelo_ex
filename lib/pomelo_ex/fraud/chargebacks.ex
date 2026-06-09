defmodule PomeloEx.Fraud.Chargebacks do
  @moduledoc """
  The Chargebacks service allows you to create and manage chargebacks for payment transactions.

  Want to know more about chargebacks? Check out our [documentation](https://docs.pomelo.la/docs/fraud/chargebacks).
  """
  alias PomeloEx.Fraud.Chargebacks.AttachFileToChargeback
  alias PomeloEx.Fraud.Chargebacks.ChargebackWebhookNotification
  alias PomeloEx.Fraud.Chargebacks.CreateChargeback
  alias PomeloEx.Fraud.Chargebacks.FindChargebacks
  alias PomeloEx.Fraud.Chargebacks.ObtainChargeback

  @doc """
  Create a chargeback for a transaction.
  """
  defdelegate create_chargeback(payload), to: CreateChargeback, as: :execute

  @doc """
  Attach a file to a chargeback.

  The API expects a `multipart/form-data` upload under the `fileUpload` key.
  This implementation sends a JSON body as a simplified interface.
  Override `execute/1` to handle multipart uploads if needed.
  """
  defdelegate attach_file_to_chargeback(payload), to: AttachFileToChargeback, as: :execute

  @doc """
  Get a chargeback by its ID.
  """
  defdelegate obtain_chargeback(payload), to: ObtainChargeback, as: :execute

  @doc """
  Search for chargebacks with optional filters.

  Supported filters: `filter[user_id]`, `filter[status]`, `filter[transaction_id]`,
  `filter[created_at][from]`, `filter[created_at][to]`,
  `filter[updated_at][from]`, `filter[updated_at][to]`, `sort`.
  """
  defdelegate find_chargebacks(payload), to: FindChargebacks, as: :execute

  @doc """
  Webhook handler for chargeback notifications.
  """
  defdelegate chargeback_webhook_notification(payload), to: ChargebackWebhookNotification, as: :execute
end
