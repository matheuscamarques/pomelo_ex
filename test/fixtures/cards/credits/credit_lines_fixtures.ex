defmodule PomeloEx.Cards.Credits.CreditLinesFixtures do
  alias PomeloEx.Types.Cards.Credits.CreditLines.CancelCreditLineType

  alias PomeloEx.Types.Cards.Credits.CreditLines.ConfirmAccelerationOfDebtForSpecificInstallmentsType

  alias PomeloEx.Types.Cards.Credits.CreditLines.ConfirmDebtRefinancingType
  alias PomeloEx.Types.Cards.Credits.CreditLines.ConfirmTotalDebtAccelerationType
  alias PomeloEx.Types.Cards.Credits.CreditLines.CreateCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLines.DebtAccelerationType
  alias PomeloEx.Types.Cards.Credits.CreditLines.DebtSimulationType
  alias PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLines.GetCreditLinesType
  alias PomeloEx.Types.Cards.Credits.CreditLines.SimulateAccelerationOfSpecificInstallmentsType
  alias PomeloEx.Types.Cards.Credits.CreditLines.SimulateDebtRefinancingType
  alias PomeloEx.Types.Cards.Credits.CreditLines.SimulateExpirationDateUpdateType
  alias PomeloEx.Types.Cards.Credits.CreditLines.SimulateTotalDebtAccelerationType
  alias PomeloEx.Types.Cards.Credits.CreditLines.UpdateCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLines.UpdateExpirationDateType

  def create_credit_line_request do
    %CreateCreditLineType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-2HMwJZo114goVi7xdSseYfujP79",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      limits: %{"single_payment" => 20000, "cash_advance_percentage" => 10},
      offer_start_date: "2022-04-20",
      due_date: 28,
      user_scoring: "A",
      person_type: "NATURAL"
    }
  end

  def create_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-2HMwKzetERdOEhbT86UweXamPle",
          "status": "ACTIVE"
        }
      }
    |
  end

  def get_credit_line_request do
    %GetCreditLineType{
      token: "fRwX12Dg3345AD",
      id: "lcr-2HMwKzetERdOEhbT86UweXamPle"
    }
  end

  def get_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-2HMwKzetERdOEhbT86UweXamPle",
          "status": "ACTIVE",
          "user_id": "usr-2HMvSDccc5PZzCvZ98lfeXamPle"
        }
      }
    |
  end

  def get_credit_lines_request do
    %GetCreditLinesType{
      token: "fRwX12Dg3345AD",
      filter_status: "ACTIVE"
    }
  end

  def get_credit_lines_response do
    ~s|
      {
        "data": [
          {
            "id": "lcr-2HMwKzetERdOEhbT86UweXamPle",
            "status": "ACTIVE"
          }
        ]
      }
    |
  end

  def update_credit_line_request do
    %UpdateCreditLineType{
      token: "fRwX12Dg3345AD",
      id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{
        "status" => "PAUSED",
        "status_detail" => %{"reason" => "FRAUD", "text" => "Additional information"}
      }
    }
  end

  def update_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-2HMwKzetERdOEhbT86UweXamPle",
          "status": "PAUSED"
        }
      }
    |
  end

  def cancel_credit_line_request do
    %CancelCreditLineType{
      token: "fRwX12Dg3345AD",
      id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"reason" => "BY_USER_WITHOUT_DEBT_ACCELERATION"}
    }
  end

  def cancel_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-2HMwKzetERdOEhbT86UweXamPle"
        }
      }
    |
  end

  def simulate_expiration_date_update_request do
    %SimulateExpirationDateUpdateType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"due_date" => 28}
    }
  end

  def simulate_expiration_date_update_response do
    ~s|
      {
        "data": {
          "old": {"start_date": "2022-04-01", "closing_date": "2022-04-30", "due_date": "2022-05-10"},
          "new": {"start_date": "2022-04-01", "closing_date": "2022-04-30", "due_date": "2022-05-15"}
        }
      }
    |
  end

  def update_expiration_date_request do
    %UpdateExpirationDateType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"due_date" => 28}
    }
  end

  def update_expiration_date_response do
    ~s|
      {
        "data": {
          "id": "lcr-2HMwKzetERdOEhbT86UweXamPle",
          "due_date": 28
        }
      }
    |
  end

  def debt_simulation_request do
    %DebtSimulationType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      transaction_ids: "ctx-1,ctx-2"
    }
  end

  def debt_simulation_response do
    ~s|
      {
        "data": {
          "total": {"amount": "100000.00", "currency": "BRL"},
          "has_pending_operations": true
        }
      }
    |
  end

  def debt_acceleration_request do
    %DebtAccelerationType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"transaction_ids" => ["ctx-1", "ctx-2"]}
    }
  end

  def debt_acceleration_response do
    ~s|
      {
        "data": {
          "message": "Debt acceleration confirmed"
        }
      }
    |
  end

  def simulate_debt_refinancing_request do
    %SimulateDebtRefinancingType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{
        "type" => "TOTAL_DEBT",
        "credit_line_id" => "lcr-2HMwKzetERdOEhbT86UweXamPle",
        "installment_quantity" => 12
      }
    }
  end

  def simulate_debt_refinancing_response do
    ~s|
      {
        "data": {
          "total": {"amount": 15000.5, "currency": "ARS"},
          "has_pending_operations": false
        }
      }
    |
  end

  def confirm_debt_refinancing_request do
    %ConfirmDebtRefinancingType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{
        "type" => "TOTAL_DEBT",
        "credit_line_id" => "lcr-2HMwKzetERdOEhbT86UweXamPle",
        "installment_quantity" => 12
      }
    }
  end

  def confirm_debt_refinancing_response do
    ~s|
      {
        "data": "Refinancing confirmed successfully for credit line [lcr-2HMwKzetERdOEhbT86UweXamPle]"
      }
    |
  end

  def simulate_total_debt_acceleration_request do
    %SimulateTotalDebtAccelerationType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle"
    }
  end

  def simulate_total_debt_acceleration_response do
    ~s|
      {
        "data": {
          "total": {"amount": "100000.00", "currency": "BRL"},
          "has_pending_operations": true
        }
      }
    |
  end

  def confirm_total_debt_acceleration_request do
    %ConfirmTotalDebtAccelerationType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"transaction_ids" => ["ctx-1", "ctx-2"]}
    }
  end

  def confirm_total_debt_acceleration_response do
    ~s|
      {
        "data": "Total debt accelerated successfully for credit line [lcr-2HMwKzetERdOEhbT86UweXamPle]"
      }
    |
  end

  def simulate_acceleration_of_specific_installments_request do
    %SimulateAccelerationOfSpecificInstallmentsType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"transaction_ids" => ["ctx-1", "ctx-2"]}
    }
  end

  def simulate_acceleration_of_specific_installments_response do
    ~s|
      {
        "data": {
          "total": {"amount": "100000.00", "currency": "BRL"},
          "has_pending_operations": true
        }
      }
    |
  end

  def confirm_acceleration_of_debt_for_specific_installments_request do
    %ConfirmAccelerationOfDebtForSpecificInstallmentsType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMwKzetERdOEhbT86UweXamPle",
      body: %{"transaction_ids" => ["ctx-1", "ctx-2"]}
    }
  end

  def confirm_acceleration_of_debt_for_specific_installments_response do
    ~s|
      {
        "data": "Acceleration of installments accelerated successfully"
      }
    |
  end
end
