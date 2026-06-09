defmodule PomeloEx.Cards.Credits.CreditLinesV2Fixtures do
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CancelCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CreateCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CreatePricingType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CreateProductType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.CreateSegmentType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.DeactivateProductType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetProductType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetProductsType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetSegmentsType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.ModifyPricingType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.UpdateCreditLineType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.UpdateProductType
  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.UpdateSegmentType

  def create_product_request do
    %CreateProductType{
      token: "fRwX12Dg3345AD",
      body: %{
        "name" => "My Credit Product",
        "type" => "CREDIT_CARD",
        "country" => "PER",
        "lifecycle" => %{"status" => "ACTIVE"},
        "credit_card" => %{
          "book_model" => "REVOLVING",
          "installments" => %{"max_installments" => 12},
          "pricing" => %{"rates" => [%{"kind" => "FINANCING", "application" => %{"percentage" => "15.00"}}]}
        }
      }
    }
  end

  def create_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-v2-product-id",
          "name": "My Credit Product",
          "type": "CREDIT_CARD",
          "country": "PER",
          "lifecycle": {"status": "ACTIVE"},
          "credit_card": {
            "book_model": "REVOLVING"
          }
        }
      }
    |
  end

  def get_products_request do
    %GetProductsType{token: "fRwX12Dg3345AD", filter_status: "ACTIVE"}
  end

  def get_products_response do
    ~s|
      {
        "data": [
          {
            "id": "lpr-v2-product-id",
            "name": "My Credit Product",
            "type": "CREDIT_CARD",
            "country": "PER",
            "lifecycle": {"status": "ACTIVE"}
          }
        ]
      }
    |
  end

  def get_product_request do
    %GetProductType{token: "fRwX12Dg3345AD", id: "lpr-v2-product-id"}
  end

  def get_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-v2-product-id",
          "name": "My Credit Product",
          "type": "CREDIT_CARD",
          "country": "PER",
          "lifecycle": {"status": "ACTIVE"}
        }
      }
    |
  end

  def update_product_request do
    %UpdateProductType{
      token: "fRwX12Dg3345AD",
      id: "lpr-v2-product-id",
      body: %{"name" => "Updated Product", "lifecycle" => %{"status" => "PAUSED"}}
    }
  end

  def update_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-v2-product-id",
          "name": "Updated Product",
          "lifecycle": {"status": "PAUSED"}
        }
      }
    |
  end

  def deactivate_product_request do
    %DeactivateProductType{token: "fRwX12Dg3345AD", id: "lpr-v2-product-id"}
  end

  def deactivate_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-v2-product-id",
          "lifecycle": {"status": "DEACTIVATED"}
        }
      }
    |
  end

  def create_pricing_request do
    %CreatePricingType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-v2-product-id",
      body: %{
        "start_date" => "2024-01-01",
        "pricing" => %{
          "book_model" => "REVOLVING",
          "rates" => [%{"kind" => "FINANCING", "application" => %{"percentage" => "18.00"}}]
        }
      }
    }
  end

  def create_pricing_response do
    ~s|
      {
        "data": {
          "start_date": "2024-01-01",
          "pricing": {
            "book_model": "REVOLVING",
            "rates": [{"kind": "FINANCING", "application": {"percentage": "18.00"}}]
          }
        }
      }
    |
  end

  def modify_pricing_request do
    %ModifyPricingType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-v2-product-id",
      body: %{
        "start_date" => "2024-02-01",
        "pricing" => %{
          "rates" => [%{"kind" => "FINANCING", "application" => %{"percentage" => "20.00"}}]
        }
      }
    }
  end

  def modify_pricing_response do
    ~s|
      {
        "data": {
          "start_date": "2024-02-01",
          "pricing": {
            "rates": [{"kind": "FINANCING", "application": {"percentage": "20.00"}}]
          }
        }
      }
    |
  end

  def create_segment_request do
    %CreateSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-v2-product-id",
      body: %{
        "name" => "Premium Segment",
        "credit_card" => %{
          "pricing" => %{"rates" => [%{"kind" => "FINANCING", "application" => %{"percentage" => "12.00"}}]},
          "minimum_payment" => %{"type" => "PERCENTAGE", "value" => "15.00"}
        }
      }
    }
  end

  def create_segment_response do
    ~s|
      {
        "data": {
          "id": "lseg-v2-segment-id",
          "product_id": "lpr-v2-product-id",
          "name": "Premium Segment",
          "lifecycle": {"status": "ACTIVE"}
        }
      }
    |
  end

  def get_segments_request do
    %GetSegmentsType{token: "fRwX12Dg3345AD", product_id: "lpr-v2-product-id"}
  end

  def get_segments_response do
    ~s|
      {
        "data": [
          {
            "id": "lseg-v2-segment-id",
            "product_id": "lpr-v2-product-id",
            "name": "Premium Segment",
            "lifecycle": {"status": "ACTIVE"}
          }
        ]
      }
    |
  end

  def get_segment_request do
    %GetSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-v2-product-id",
      segment_id: "lseg-v2-segment-id"
    }
  end

  def get_segment_response do
    ~s|
      {
        "data": {
          "id": "lseg-v2-segment-id",
          "product_id": "lpr-v2-product-id",
          "name": "Premium Segment",
          "lifecycle": {"status": "ACTIVE"}
        }
      }
    |
  end

  def update_segment_request do
    %UpdateSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-v2-product-id",
      segment_id: "lseg-v2-segment-id",
      body: %{"name" => "Standard Segment"}
    }
  end

  def update_segment_response do
    ~s|
      {
        "data": {
          "id": "lseg-v2-segment-id",
          "name": "Standard Segment"
        }
      }
    |
  end

  def create_credit_line_request do
    %CreateCreditLineType{
      token: "fRwX12Dg3345AD",
      body: %{
        "user_id" => "usr-v2-user-id",
        "product_id" => "lpr-v2-product-id",
        "person_type" => "NATURAL",
        "limit" => %{"type" => "CREDIT", "single_payment" => 50000, "cash_advance_percentage" => 10},
        "lifecycle" => %{"offer" => %{"start_date" => "2024-01-01", "end_date" => "2025-01-01"}},
        "billing_cycles" => %{"billing_date_strategy" => "FIXED", "due_day" => 15}
      }
    }
  end

  def create_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-v2-credit-line-id",
          "user_id": "usr-v2-user-id",
          "product_id": "lpr-v2-product-id",
          "person_type": "NATURAL",
          "lifecycle": {"status": "ACTIVE"}
        }
      }
    |
  end

  def get_credit_line_request do
    %GetCreditLineType{token: "fRwX12Dg3345AD", id: "lcr-v2-credit-line-id"}
  end

  def get_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-v2-credit-line-id",
          "user_id": "usr-v2-user-id",
          "product_id": "lpr-v2-product-id",
          "lifecycle": {"status": "ACTIVE"}
        }
      }
    |
  end

  def update_credit_line_request do
    %UpdateCreditLineType{
      token: "fRwX12Dg3345AD",
      id: "lcr-v2-credit-line-id",
      body: %{
        "person_type" => "LEGAL",
        "lifecycle" => %{"status" => %{"value" => "PAUSED", "detail" => "FRAUD"}}
      }
    }
  end

  def update_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-v2-credit-line-id",
          "person_type": "LEGAL",
          "lifecycle": {"status": "PAUSED"}
        }
      }
    |
  end

  def cancel_credit_line_request do
    %CancelCreditLineType{
      token: "fRwX12Dg3345AD",
      id: "lcr-v2-credit-line-id",
      body: %{"reason" => "USER_REQUESTED", "debt_acceleration" => true}
    }
  end

  def cancel_credit_line_response do
    ~s|
      {
        "data": {
          "id": "lcr-v2-credit-line-id",
          "lifecycle": {"status": "CANCELLED"}
        }
      }
    |
  end
end
