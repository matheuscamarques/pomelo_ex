defmodule PomeloEx.Cards.OnUsFixtures do
  alias PomeloEx.Types.Cards.Processing.OnUs.AuthorizeType
  alias PomeloEx.Types.Cards.Processing.OnUs.PresentTransactionByExternalIdType
  alias PomeloEx.Types.Cards.Processing.OnUs.PresentTransactionByPomeloIdType
  alias PomeloEx.Types.Cards.Processing.OnUs.ReverseTransactionByExternalIdType
  alias PomeloEx.Types.Cards.Processing.OnUs.ReverseTransactionType

  def authorize_request do
    %AuthorizeType{
      token: "test_token_123",
      transaction: %{
        "type" => "REFUND",
        "local_date_time" => "2025-09-12T14:15:22"
      },
      pos: %{
        "point_type" => "POS"
      }
    }
  end

  def reverse_transaction_request do
    %ReverseTransactionType{
      token: "test_token_123",
      original_transaction_id: "ctx-123",
      transaction: %{
        "type" => "REFUND"
      }
    }
  end

  def reverse_transaction_by_external_id_request do
    %ReverseTransactionByExternalIdType{
      token: "test_token_123",
      transaction: %{
        "external_transaction_id" => "ext-123"
      }
    }
  end

  def present_transaction_by_external_id_request do
    %PresentTransactionByExternalIdType{
      token: "test_token_123",
      type: "PRESENTMENT",
      external_presentment_id: "ext-pres-123",
      reconciliation_date: "2025-09-12"
    }
  end

  def present_transaction_by_pomelo_id_request do
    %PresentTransactionByPomeloIdType{
      token: "test_token_123",
      original_presentment_id: "pres-123",
      external_presentment_id: "ext-pres-123",
      reconciliation_date: "2025-09-12"
    }
  end

  def on_us_success_response do
    ~s|
    {
      "status": "APPROVED",
      "id": "ctx-123"
    }
    |
  end
end
