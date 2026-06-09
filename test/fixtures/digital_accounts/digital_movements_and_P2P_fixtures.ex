defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2PFixtures do
  alias PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovementsType
  alias PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransactionType
  alias PomeloEx.Types.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalanceType

  def authorize_digital_movements_request do
    %AuthorizeDigitalMovementsType{
      token: "fRwX12Dg3345AD",
      account_id: "acc-23GMRyaPjVbczjGtLfQ6zgUJmLv",
      type: "CARD_PURCHASE",
      process_type: "REFUND",
      parent_tx_id: "atx-23GMkfOa7V1MqUlvEic4Dp7XhTT",
      data: %{
        "tx_properties" => %{
          "merchant_id" => "13091231029",
          "address" => "Fake Street 123",
          "merchant_name" => "Example Store",
          "merchant_logo_url" => "http://logo-url",
          "card_type" => "DEBIT",
          "point_type" => "POS",
          "entry_mode" => "UNKNOWN",
          "last_digits" => "1234",
          "card_brand" => "Visa",
          "card_bin" => "4344",
          "mcc" => "5021"
        },
        "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
        "details" => [
          %{
            "amount" => "999.99",
            "entry_type" => "DEBIT",
            "type" => "BASE",
            "subtype" => "example_value",
            "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
            "metadata" => ~s({"extra_property_1": "My value"})
          }
        ],
        "metadata" => ~s({"extra_property_1": "My value"})
      },
      entry_type: "DEBIT",
      total_amount: "999.99",
      process_before: "2026-06-09T16:50:30.616Z",
      accounts_id: ["example_value"],
      client_id: "example_value",
      local: %{"total" => "example_value", "currency" => "example_value"},
      settlement: %{"total" => "example_value", "currency" => "example_value"},
      transaction: %{"total" => "example_value", "currency" => "example_value"}
    }
  end

  def authorize_digital_movements_response do
    ~s|
      {
        "id": "atx-230ReKOtS2lv0yUi2FKG98ycdXZ",
        "result": "REJECTED",
        "rejection_reason": "INSUFFICIENT_FUNDS",
        "created_at": "2024-01-01T00:00:00Z",
        "balance": "string",
        "exchange_data": {
          "exchange_rate_id": "string",
          "exchange_rate": 0,
          "origin_currency": "string",
          "origin_amount": 0,
          "destination_currency": "string",
          "destination_amount": 0,
          "account_id": "string"
        }
      }
    |
  end

  def authorize_P2P_transaction_request do
    %AuthorizeP2PTransactionType{
      token: "fRwX12Dg3345AD",
      source_account_id: "acc-23GMRyaPjVbczjGtLfQ6zgUJmLv",
      destination_account_id: "acc-76SOlsOklsdl92OsldllKzgUVjUu",
      source_data: %{
        "metadata" => ~s({"extra_property_1": "My value"}),
        "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
        "details" => [
          %{
            "amount" => "999.99",
            "entry_type" => "DEBIT",
            "type" => "BASE",
            "subtype" => "example_value",
            "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
            "metadata" => ~s({"extra_property_1": "My value"})
          }
        ]
      },
      destination_data: %{
        "metadata" => ~s({"extra_property_1": "My value"}),
        "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
        "details" => [
          %{
            "amount" => "999.99",
            "entry_type" => "DEBIT",
            "type" => "BASE",
            "subtype" => "example_value",
            "description" => %{"es-AR" => "Alguna descripción.", "en-US" => "Some description."},
            "metadata" => ~s({"extra_property_1": "My value"})
          }
        ]
      },
      total_amount: "1200.15",
      process_before: "2026-06-09T16:50:30.982Z"
    }
  end

  def authorize_P2P_transaction_response do
    ~s|
      {
        "source_account_tx": {
          "id": "atx-230ReKOtS2lv0yUi2FKG98ycdXZ",
          "result": "REJECTED",
          "rejection_reason": "INSUFFICIENT_FUNDS",
          "created_at": "2024-01-01T00:00:00Z",
          "balance": "string",
          "exchange_data": {
            "exchange_rate_id": "string",
            "exchange_rate": 0,
            "origin_currency": "string",
            "origin_amount": 0,
            "destination_currency": "string",
            "destination_amount": 0,
            "account_id": "string"
          }
        },
        "destination_account_tx": {
          "id": "atx-230ReKOtS2lv0yUi2FKG98ycdXZ",
          "result": "REJECTED",
          "rejection_reason": "INSUFFICIENT_FUNDS",
          "created_at": "2024-01-01T00:00:00Z",
          "balance": "string",
          "exchange_data": {
            "exchange_rate_id": "string",
            "exchange_rate": 0,
            "origin_currency": "string",
            "origin_amount": 0,
            "destination_currency": "string",
            "destination_amount": 0,
            "account_id": "string"
          }
        }
      }
    |
  end

  def update_account_balance_request do
    %UpdateAccountBalanceType{
      token: "fRwX12Dg3345AD",
      account_id: "acc-23GMRyaPjVbczjGtLfQ6zgUJmLv",
      balance: "100.1"
    }
  end

  def update_account_balance_response do
    ~s|
      {
        "result": "APPLIED"
      }
    |
  end
end
