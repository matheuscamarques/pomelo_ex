defmodule PomeloEx.LoyaltyFixtures do
  alias PomeloEx.Types.Loyalty.GetAccountBalanceType
  alias PomeloEx.Types.Loyalty.ManuallyCreditPointsOrCashbackType
  alias PomeloEx.Types.Loyalty.ManuallyDebitPointsOrCashbackType
  alias PomeloEx.Types.Loyalty.PendingPointsNotificationType
  alias PomeloEx.Types.Loyalty.PointsCancellationNotificationType
  alias PomeloEx.Types.Loyalty.PointsConfirmationNotificationType

  def manually_credit_points_or_cashback_request do
    %ManuallyCreditPointsOrCashbackType{
      token: "fRwX12Dg3345AD",
      account_type: "points",
      amount: Decimal.new("1000.5"),
      reason: "Manual adjustment",
      card_id: "card_123456"
    }
  end

  def manually_credit_points_or_cashback_response do
    ~s|
      {
        "points": 1000,
        "cashback": 0,
        "updatedBalance": 5000
      }
    |
  end

  def manually_debit_points_or_cashback_request do
    %ManuallyDebitPointsOrCashbackType{
      token: "fRwX12Dg3345AD",
      account_type: "points",
      amount: Decimal.new("1000.5"),
      reason: "Manual adjustment",
      card_id: "card_123456"
    }
  end

  def manually_debit_points_or_cashback_response do
    ~s|
      {
        "points": 1000,
        "cashback": 0,
        "updatedBalance": 5000
      }
    |
  end

  def get_account_balance_request(params \\ %{}) do
    Map.merge(
      %GetAccountBalanceType{token: "fRwX12Dg3345AD", card_id: "card_123456"},
      params
    )
  end

  def get_account_balance_response do
    ~s|
      {
        "points": 5000,
        "cashback": 250
      }
    |
  end

  def pending_points_notification_request do
    %PendingPointsNotificationType{
      event_id: "loyalty-pending",
      idempotency_key: "ctx-38Wig8u500urqNCgMAy1vE4voXl-pending"
    }
  end

  def points_confirmation_notification_request do
    %PointsConfirmationNotificationType{
      event_id: "loyalty-confirm",
      idempotency_key: "lye-38WileXCmO8aODJY0BjlndumK0x-confirm"
    }
  end

  def points_cancellation_notification_request do
    %PointsCancellationNotificationType{
      event_id: "loyalty-cancel",
      idempotency_key: "lye-38WileXCmO8aODJY0BjlndumK0x-cancel"
    }
  end
end
