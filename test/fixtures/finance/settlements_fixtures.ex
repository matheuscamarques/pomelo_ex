defmodule PomeloEx.Finance.SettlementsFixtures do
  alias PomeloEx.Types.Finance.Settlements.GetBalancesType
  alias PomeloEx.Types.Finance.Settlements.GetLastSettlementType
  alias PomeloEx.Types.Finance.Settlements.NewSettlementType
  alias PomeloEx.Types.Finance.Settlements.NotifyDepositType

  def get_balances_request do
    %GetBalancesType{token: "fRwX12Dg3345AD", country: "ARG"}
  end

  def get_balances_response do
    ~s|
      {
        "data": {
          "balances": [
            {
              "currency": "ARS",
              "origin": "DOMESTIC",
              "balance": "1250.75"
            }
          ]
        }
      }
    |
  end

  def notify_deposit_request do
    %NotifyDepositType{
      token: "fRwX12Dg3345AD",
      file: "example_value",
      country: "ARG",
      currency_name: "USD",
      origin: "DOMESTIC",
      amount: Decimal.new("1250.75")
    }
  end

  def notify_deposit_response do
    ~s|
      {
        "data": {
          "id": "dep-3A6GlWtHT1Tfpb5mcMLxatRSmNv",
          "status": "REVISION",
          "noticed_amount": 1250.75,
          "currency_name": "USD",
          "origin": "DOMESTIC",
          "country": "ARG",
          "created_at": "2026-05-21T15:00:00.000Z"
        }
      }
    |
  end

  def get_last_settlement_request do
    %GetLastSettlementType{token: "fRwX12Dg3345AD", country: "ARG"}
  end

  def get_last_settlement_response do
    ~s|
      {
        "data": {
          "id": "set-3A6GlWtHT1Tfpb5mcMLxatRSmNv",
          "status": "PENDING",
          "settlement_date": "2026-05-21",
          "due_date": "2026-05-22",
          "exchange_rate": "1000.0000",
          "settlement_concepts": [
            {
              "origin": "DOMESTIC",
              "currency": "ARS",
              "total": "900.00",
              "details": [
                {
                  "type": "PRESENTMENTS",
                  "amount": "900.00"
                }
              ]
            }
          ],
          "prefunding": [
            {
              "origin": "DOMESTIC",
              "currency": "ARS",
              "requested_amount": "100.00",
              "paid_amount": "50.00",
              "available_balance": "25.00"
            }
          ],
          "settlement_total": [
            {
              "origin": "DOMESTIC",
              "currency": "ARS",
              "total": "1000.00",
              "payment_info": {
                "type": "BANK",
                "bank_name": "Bank Name",
                "account_number": "000123456789",
                "identifier": "20123456789",
                "account_type": "CHECKING",
                "business_name": "Pomelo",
                "alias": "pomelo.finance",
                "bank_code": "001",
                "routing_number": "021000021",
                "swift": "ABCDUS33"
              }
            }
          ]
        }
      }
    |
  end

  def new_settlement_request do
    %NewSettlementType{
      event_id: "finance_new_settlement",
      idempotency_key: "finance_new_settlementset-3A6GlWtHT1Tfpb5mcMLxatRSmNv",
      settlement_id: "set-3A6GlWtHT1Tfpb5mcMLxatRSmNv",
      settlement_status: "PENDING",
      settlement_date: "2026-05-21",
      country: "ARG"
    }
  end
end
