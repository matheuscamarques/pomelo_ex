defmodule PomeloEx.Cards.Credits.CreditProductFixtures do
  alias PomeloEx.Types.Cards.Credits.CreditProduct.CreatePriceUpdateType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.CreateProductType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.CreateSegmentType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.DeactivatingProductType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetPriceUpdateHistoryType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetProductType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetProductsType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetSegmentRateUpdatesType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetSegmentType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.GetSegmentsType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.ModifyPendingPriceUpdateType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.UpdateProductType
  alias PomeloEx.Types.Cards.Credits.CreditProduct.UpdateSegmentType

  def create_product_request do
    %CreateProductType{
      token: "fRwX12Dg3345AD",
      body: %{
        "cutoff_day" => 15,
        "due_day" => 5,
        "currency" => "ARS",
        "country" => "ARG",
        "description" => "My product",
        "rates" => %{
          "financing" => "15.00",
          "late_fee" => "25.00",
          "cash_advance" => "50.00",
          "revolving" => "100.00"
        }
      }
    }
  end

  def create_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "status": "ACTIVE",
          "country": "ARG",
          "currency": "ARS",
          "cutoff_day": 15,
          "due_day": 5,
          "description": "My product",
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def get_products_request do
    %GetProductsType{
      token: "fRwX12Dg3345AD",
      filter_status: "ACTIVE"
    }
  end

  def get_products_response do
    ~s|
      {
        "data": [
          {
            "id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
            "status": "ACTIVE",
            "country": "ARG",
            "currency": "ARS",
            "description": "My product",
            "created_at": "2022-04-30T00:00:00Z"
          }
        ]
      }
    |
  end

  def get_product_request do
    %GetProductType{
      token: "fRwX12Dg3345AD",
      id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
    }
  end

  def get_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "status": "ACTIVE",
          "country": "ARG",
          "currency": "ARS",
          "description": "My product",
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def update_product_request do
    %UpdateProductType{
      token: "fRwX12Dg3345AD",
      id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      body: %{
        "description" => "Updated product"
      }
    }
  end

  def update_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "status": "ACTIVE",
          "description": "Updated product",
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def deactivating_product_request do
    %DeactivatingProductType{
      token: "fRwX12Dg3345AD",
      id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
    }
  end

  def deactivating_product_response do
    ~s|
      {
        "data": {
          "id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "status": "INACTIVE"
        }
      }
    |
  end

  def create_price_update_request do
    %CreatePriceUpdateType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      body: %{
        "start_date" => "2024-01-15",
        "rates" => %{
          "financing" => "16.00",
          "late_fee" => "26.00"
        }
      }
    }
  end

  def create_price_update_response do
    ~s|
      {
        "data": {
          "start_date": "2024-01-15",
          "rates": {
            "financing": "16.00",
            "late_fee": "26.00"
          }
        }
      }
    |
  end

  def get_price_update_history_request do
    %GetPriceUpdateHistoryType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
    }
  end

  def get_price_update_history_response do
    ~s|
      {
        "data": [
          {
            "start_date": "2024-01-15",
            "rates": {
              "financing": "16.00",
              "late_fee": "26.00"
            }
          }
        ]
      }
    |
  end

  def modify_pending_price_update_request do
    %ModifyPendingPriceUpdateType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      start_date: "2024-01-15",
      body: %{
        "rates" => %{
          "financing" => "17.00"
        }
      }
    }
  end

  def modify_pending_price_update_response do
    ~s|
      {
        "data": {
          "start_date": "2024-01-15",
          "rates": {
            "financing": "17.00"
          }
        }
      }
    |
  end

  def create_segment_request do
    %CreateSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      body: %{
        "name" => "Premium Segment",
        "pricing" => %{
          "rates" => %{
            "financing" => "15.00",
            "late_fee" => "25.00"
          }
        }
      }
    }
  end

  def create_segment_response do
    ~s|
      {
        "data": {
          "id": "lsg-3mkvSzWjc5La6WDTlgFweXAmP23",
          "product_id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "name": "Premium Segment",
          "status": "ACTIVE",
          "pricing": {
            "start_date": "2022-04-30",
            "rates": {
              "financing": "15.00",
              "late_fee": "25.00"
            }
          },
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def get_segments_request do
    %GetSegmentsType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle"
    }
  end

  def get_segments_response do
    ~s|
      {
        "data": [
          {
            "id": "lsg-3mkvSzWjc5La6WDTlgFweXAmP23",
            "product_id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
            "name": "Premium Segment",
            "status": "ACTIVE",
            "created_at": "2022-04-30T00:00:00Z"
          }
        ]
      }
    |
  end

  def get_segment_request do
    %GetSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      segment_id: "lsg-3mkvSzWjc5La6WDTlgFweXAmP23"
    }
  end

  def get_segment_response do
    ~s|
      {
        "data": {
          "id": "lsg-3mkvSzWjc5La6WDTlgFweXAmP23",
          "product_id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "name": "Premium Segment",
          "status": "ACTIVE",
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def update_segment_request do
    %UpdateSegmentType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      segment_id: "lsg-3mkvSzWjc5La6WDTlgFweXAmP23",
      body: %{
        "name" => "Standard Segment"
      }
    }
  end

  def update_segment_response do
    ~s|
      {
        "data": {
          "id": "lsg-3mkvSzWjc5La6WDTlgFweXAmP23",
          "product_id": "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
          "name": "Standard Segment",
          "status": "ACTIVE",
          "created_at": "2022-04-30T00:00:00Z"
        }
      }
    |
  end

  def get_segment_rate_updates_request do
    %GetSegmentRateUpdatesType{
      token: "fRwX12Dg3345AD",
      product_id: "lpr-2HMvSzWjc5La6WDTlgFweXAmPle",
      segment_id: "lsg-3mkvSzWjc5La6WDTlgFweXAmP23"
    }
  end

  def get_segment_rate_updates_response do
    ~s|
      {
        "data": [
          {
            "start_date": "2022-04-30",
            "rates": {
              "financing": "15.00",
              "late_fee": "25.00"
            }
          }
        ]
      }
    |
  end
end
