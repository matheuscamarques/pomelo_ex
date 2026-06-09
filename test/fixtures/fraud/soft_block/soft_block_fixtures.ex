defmodule PomeloEx.Fraud.SoftBlockFixtures do
  alias PomeloEx.Types.Fraud.SoftBlock.CreateSoftBlockType
  alias PomeloEx.Types.Fraud.SoftBlock.GetSoftBlockStatusType
  alias PomeloEx.Types.Fraud.SoftBlock.GetSoftBlockListType
  alias PomeloEx.Types.Fraud.SoftBlock.UpdateSoftBlockType
  alias PomeloEx.Types.Fraud.SoftBlock.RemoveSoftBlockType

  def create_soft_block_request do
    %CreateSoftBlockType{
      token: "fRwX12Dg3345AD",
      merchant_name: "FACEBOOK*12345",
      expiration_date: "3000-01-01T13:40:23Z"
    }
  end

  def create_soft_block_response do
    ~s|
      {
        "data": {
          "message": "SOFTBLOCK applied to merchant."
        }
      }
    |
  end

  def get_soft_block_status_request do
    %GetSoftBlockStatusType{
      token: "fRwX12Dg3345AD",
      merchant_name: "FACEBOOK*12345"
    }
  end

  def get_soft_block_status_response do
    ~s|
      {
        "data": {
          "message": "FACEBOOK*MARKET",
          "applied_date": "2021-01-01T12:00:00Z"
        }
      }
    |
  end

  def get_soft_block_list_request do
    %GetSoftBlockListType{
      token: "fRwX12Dg3345AD",
      page_size: 10,
      page_number: 0
    }
  end

  def get_soft_block_list_response do
    ~s|
      {
        "data": [
          {
            "message": "FACEBOOK*MARKET",
            "applied_date": "2021-01-01T12:00:00Z"
          }
        ]
      }
    |
  end

  def update_soft_block_request do
    %UpdateSoftBlockType{
      token: "fRwX12Dg3345AD",
      merchant_name: "FACEBOOK*12345",
      expiration_date: "3000-02-01T13:40:23Z"
    }
  end

  def update_soft_block_response do
    ~s|
      {
        "data": {
          "message": "SOFTBLOCK applied to merchant."
        }
      }
    |
  end

  def remove_soft_block_request do
    %RemoveSoftBlockType{
      token: "fRwX12Dg3345AD",
      merchant_name: "FACEBOOK*12345"
    }
  end

  def remove_soft_block_response do
    ~s|
      {
        "data": {
          "message": "SOFTBLOCK deleted for merchant"
        }
      }
    |
  end
end
