defmodule PomeloEx.Cards.ProcessingTransactionsFixtures do
  alias PomeloEx.Types.Cards.Processing.Transactions.AdjustmentsType
  alias PomeloEx.Types.Cards.Processing.Transactions.AuthorizeTransactionType
  alias PomeloEx.Types.Cards.Processing.Transactions.CardShippingOfOtpCodesType
  alias PomeloEx.Types.Cards.Processing.Transactions.NotificationsType
  alias PomeloEx.Types.Cards.Processing.Transactions.PresentmentsNotificationsType

  def authorize_transaction_request do
    %AuthorizeTransactionType{
      type: "debit",
      transaction: %{
        "id" => "ctx-200kXoaEJLNzcsvNxY1pmBO7fEx",
        "type" => "PURCHASE"
      },
      merchant: %{
        "id" => "123e4567-e89b-12d3-a456-426614174000",
        "name" => "comercio"
      },
      card: %{
        "id" => "c-1625519392748E6XZBK"
      },
      amount: %{
        "local" => %{"total" => "99.49", "currency" => "ARS"}
      }
    }
  end

  def adjustments_request do
    %AdjustmentsType{
      type: "debit",
      transaction: %{
        "id" => "ctx-200kXoaEJLNzcsvNxY1pmBO7fEx",
        "type" => "PURCHASE"
      },
      merchant: %{
        "id" => "123e4567-e89b-12d3-a456-426614174000"
      },
      card: %{
        "id" => "c-1625519392748E6XZBK"
      },
      amount: %{
        "local" => %{"total" => "99.49", "currency" => "ARS"}
      }
    }
  end

  def notifications_request do
    %NotificationsType{
      event_id: "authorization-advice",
      event_detail: %{
        "transaction" => %{"id" => "ctx-200kXoaEJLNzcsvNxY1pmBO7fEx"}
      },
      idempotency_key: "ctx-2CIllOHdIcC5qWjpiwRlFy2nZM8"
    }
  end

  def presentments_notifications_request do
    %PresentmentsNotificationsType{
      event_id: "presentment-notification",
      event_detail: %{
        "type" => "PRESENTMENT",
        "id" => "cpr-2gxSB260ekE5kBJyS5Pn70OPwoQ"
      }
    }
  end

  def card_shipping_of_otp_codes_request do
    %CardShippingOfOtpCodesType{
      event_id: "otp_sent",
      idempotency_key: "a11a7c00-7c29-4fa0-87ef-3e2b1055eb1d",
      otp: "436249",
      card_id: "crd-2T5s6CzCarcg7zXmyihrTjSGNrn",
      username: "Juan Perez",
      email: "juan.perez@email.com",
      phone: "1123456789",
      merchant_name: "AIRBNB.COM",
      transaction_amount: "5.00",
      transaction_currency: "MXN"
    }
  end
end
