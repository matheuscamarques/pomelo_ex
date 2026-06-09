defmodule PomeloEx.Loyalty do
  @moduledoc """
  Loyalty
  The Loyalty API contains all the endpoints needed to manage loyalty campaigns and their rewards, whether points, cashback, or miles.

  ## Account Management
  You can query your customers' reward balances and also make manual adjustments of points, cashback, or miles when needed.

  ## Notifications
  We will send webhook notifications for these events:
  - **Pending rewards**: when a transaction is authorized and points, cashback, or miles are generated pending credit.
  - **Reward confirmation**: when the presentment is made and points, cashback, or miles are credited.
  - **Reward cancellation**: when a transaction that had added points, cashback, or miles is cancelled.
  """
  alias PomeloEx.Loyalty.GetAccountBalance
  alias PomeloEx.Loyalty.ManuallyCreditPointsOrCashback
  alias PomeloEx.Loyalty.ManuallyDebitPointsOrCashback
  alias PomeloEx.Loyalty.PendingPointsNotification
  alias PomeloEx.Loyalty.PointsCancellationNotification
  alias PomeloEx.Loyalty.PointsConfirmationNotification

  @doc """
  Manually credit points or cashback
  The /loyalty/v1/accounts/{accountType}/mint endpoint credits (adds) points or cashback to a loyalty member's account.

  The account_type parameter specifies the type of account (e.g., "points").
  """
  defdelegate manually_credit_points_or_cashback(payload), to: ManuallyCreditPointsOrCashback, as: :execute

  @doc """
  Manually debit points or cashback
  The /loyalty/v1/accounts/{accountType}/burn endpoint debits (subtracts) points or cashback from a loyalty member's account.

  The account_type parameter specifies the type of account (e.g., "points").
  """
  defdelegate manually_debit_points_or_cashback(payload), to: ManuallyDebitPointsOrCashback, as: :execute

  @doc """
  Get account balance
  The /loyalty/v1/accounts/balance endpoint retrieves the current points and cashback balance of a loyalty member.
  Exactly one identifier must be provided: card_id or user_id.
  """
  defdelegate get_account_balance(payload), to: GetAccountBalance, as: :execute

  @doc """
  Pending points notification
  Webhook that notifies when there are points pending to be credited for a transaction.

  You must include this endpoint in your service so that we can provide you with real-time pending points updates.

  Considerations
  - We expect a response in the 2XX range to ensure that you've received the notification.
  """
  defdelegate pending_points_notification(payload), to: PendingPointsNotification, as: :execute

  @doc """
  Points confirmation notification
  Webhook that notifies when points have been confirmed and credited/debited.

  You must include this endpoint in your service so that we can provide you with real-time points confirmation updates.

  Considerations
  - We expect a response in the 2XX range to ensure that you've received the notification.
  """
  defdelegate points_confirmation_notification(payload), to: PointsConfirmationNotification, as: :execute

  @doc """
  Points cancellation notification
  Webhook that notifies when a points transaction has been cancelled.

  You must include this endpoint in your service so that we can provide you with real-time points cancellation updates.

  Considerations
  - We expect a response in the 2XX range to ensure that you've received the notification.
  """
  defdelegate points_cancellation_notification(payload), to: PointsCancellationNotification, as: :execute
end
