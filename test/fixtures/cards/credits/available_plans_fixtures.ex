defmodule PomeloEx.Cards.Credits.AvailablePlansFixtures do
  alias PomeloEx.Types.Cards.Credits.AvailablePlans.GetInstallmentPlansType
  alias PomeloEx.Types.Cards.Credits.AvailablePlans.GetRefinancingPlansType

  def get_installment_plans_request do
    %GetInstallmentPlansType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
      filter_status: "OPEN",
      filter_installment_status: "NOT_BILLED",
      filter_transaction_id: "ctx-200kXoaEJLNzcsvNxY1pmBO7fEx",
      page_number: 0,
      page_size: 10
    }
  end

  def get_installment_plans_response do
    ~s|
      {
        "data": [
          {
            "credit_line_id": "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
            "transaction": {
              "id": "ctx-200kXoaEJLNzcsvNxY1pmBO7fEx",
              "amount": "10",
              "date": "2022-08-24T14:15:22",
              "merchant": "UBER",
              "total_amount": "10"
            },
            "outstanding_debt": "12",
            "interest_rate": "1",
            "status": "OPEN",
            "installments": [
              {
                "number": 1,
                "due_date": "2024-01-03",
                "amount": "0",
                "principal": "5",
                "interest": "1",
                "taxes": [
                  {
                    "name": "DAILY_IOF",
                    "amount": 20,
                    "rate": 3
                  }
                ],
                "status": "NOT_BILLED"
              }
            ]
          }
        ]
      }
    |
  end

  def get_refinancing_plans_request do
    %GetRefinancingPlansType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
      filter_status: "OPEN",
      filter_installment_status: "NOT_BILLED",
      filter_refinancing_id: "lrc-1",
      page_number: 0,
      page_size: 10
    }
  end

  def get_refinancing_plans_response do
    ~s|
      {
        "data": [
          {
            "credit_line_id": "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
            "refinancing": {
              "id": "lrc-1",
              "principal_amount": "10",
              "date": "2022-08-24T14:15:22",
              "total_taxes_amount": "10",
              "total_interest_amount": "10",
              "origin": "MANDATORY_REFINANCING",
              "type": "STACKING",
              "total_amount": "10"
            },
            "outstanding_debt": "12",
            "interest_rate": "1",
            "rates": [
              {"name": "TFC_REFINANCING", "rate": 0.3, "subtype": "CET"}
            ],
            "status": "OPEN",
            "installments": [
              {
                "number": 1,
                "due_date": "2024-01-03",
                "amount": "0",
                "principal": "5",
                "interest": "1",
                "taxes": [
                  {"name": "DAILY_IOF", "amount": 20, "rate": 3}
                ],
                "status": "NOT_BILLED"
              }
            ]
          }
        ]
      }
    |
  end
end
