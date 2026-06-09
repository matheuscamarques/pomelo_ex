defmodule PomeloEx.Fraud.ChargebacksFixtures do
  alias PomeloEx.Types.Fraud.Chargebacks.CreateChargebackType
  alias PomeloEx.Types.Fraud.Chargebacks.AttachFileToChargebackType
  alias PomeloEx.Types.Fraud.Chargebacks.ObtainChargebackType
  alias PomeloEx.Types.Fraud.Chargebacks.FindChargebacksType

  def create_chargeback_request do
    %CreateChargebackType{
      token: "fRwX12Dg3345AD",
      body: %{
        "card_replacement" => true,
        "country_id" => "ARG",
        "description" => "Fraudulent transaction",
        "dispute_amount" => 1500,
        "dispute_type" => "CONTROVERSY",
        "reason" => "VIRTUAL_PAYMENT",
        "transaction_id" => "ctx-1a2b3c4d5e",
        "trust_credit_applied" => false
      }
    }
  end

  def create_chargeback_response do
    ~s|
      {
        "id": "cbk-1ab2c3d4",
        "amount": 1500,
        "status": "PENDING",
        "transaction_id": "ctx-1a2b3c4d5e",
        "dispute_type": "CONTROVERSY",
        "reason": "VIRTUAL_PAYMENT",
        "card_replacement": true,
        "country_id": "ARG",
        "currency": "ARS",
        "trust_credit_applied": false,
        "liability": "MERCHANT"
      }
    |
  end

  def attach_file_request do
    %AttachFileToChargebackType{
      token: "fRwX12Dg3345AD",
      chargeback_id: "cbk-1ab2c3d4",
      body: %{
        "fileUpload" => "base64_encoded_file_content"
      }
    }
  end

  def attach_file_response do
    ~s|
      {
        "error": false,
        "info": "File attached successfully",
        "msg": null
      }
    |
  end

  def obtain_chargeback_request do
    %ObtainChargebackType{
      token: "fRwX12Dg3345AD",
      chargeback_id: "cbk-1ab2c3d4"
    }
  end

  def obtain_chargeback_response do
    ~s|
      {
        "data": {
          "id": "cbk-1ab2c3d4",
          "amount": 1500,
          "status": "PENDING",
          "transaction_id": "ctx-1a2b3c4d5e",
          "dispute_type": "CONTROVERSY",
          "reason": "VIRTUAL_PAYMENT",
          "country_id": "ARG",
          "currency": "ARS"
        }
      }
    |
  end

  def find_chargebacks_request do
    %FindChargebacksType{
      token: "fRwX12Dg3345AD",
      filter_status: "PENDING",
      filter_user_id: nil,
      filter_transaction_id: nil
    }
  end

  def find_chargebacks_response do
    ~s|
      {
        "data": [
          {
            "id": "cbk-1ab2c3d4",
            "amount": 1500,
            "status": "PENDING",
            "transaction_id": "ctx-1a2b3c4d5e",
            "dispute_type": "CONTROVERSY"
          }
        ],
        "meta": {
          "pagination": {
            "current_page": 0,
            "page_size": 10,
            "total_items": 1,
            "total_pages": 1
          }
        }
      }
    |
  end
end
