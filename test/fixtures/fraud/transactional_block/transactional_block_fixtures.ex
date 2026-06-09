defmodule PomeloEx.Fraud.TransactionalBlockFixtures do
  alias PomeloEx.Types.Fraud.TransactionalBlock.CreateBlockType
  alias PomeloEx.Types.Fraud.TransactionalBlock.GetBlockStatusType
  alias PomeloEx.Types.Fraud.TransactionalBlock.GetBlockListType
  alias PomeloEx.Types.Fraud.TransactionalBlock.UpdateBlockType
  alias PomeloEx.Types.Fraud.TransactionalBlock.DeleteBlockType

  def create_block_request do
    %CreateBlockType{
      token: "fRwX12Dg3345AD",
      type: "merchant_id",
      body: %{
        "merchant_id" => "123456799999",
        "expiration_date" => "3000-01-01T13:40:23Z"
      }
    }
  end

  def create_block_response do
    ~s|
      {
        "data": {
          "message": "BLOCKLIST applied successfully."
        }
      }
    |
  end

  def get_block_status_request do
    %GetBlockStatusType{
      token: "fRwX12Dg3345AD",
      type: "merchant_id",
      identifier: "123456799999"
    }
  end

  def get_block_status_response do
    ~s|
      {
        "data": {
          "message": "FACEBOOK*MARKET",
          "applied_date": "2021-01-01T12:00:00Z"
        }
      }
    |
  end

  def get_block_list_request do
    %GetBlockListType{
      token: "fRwX12Dg3345AD",
      type: "merchant",
      page_size: 10,
      page_number: 0,
      filter_type: "id"
    }
  end

  def get_block_list_response do
    ~s|
      {
        "data": [
          {
            "message": "FACEBOOK*MARKET",
            "applied_date": "2021-01-01T12:00:00Z",
            "type": "merchant"
          }
        ]
      }
    |
  end

  def update_block_request do
    %UpdateBlockType{
      token: "fRwX12Dg3345AD",
      type: "merchant_id",
      body: %{
        "merchant_id" => "123456799999",
        "expiration_date" => "3000-02-01T13:40:23Z"
      }
    }
  end

  def update_block_response do
    ~s|
      {
        "data": {
          "message": "BLOCKLIST applied successfully."
        }
      }
    |
  end

  def delete_block_request do
    %DeleteBlockType{
      token: "fRwX12Dg3345AD",
      type: "merchant_id",
      identifier: "123456799999"
    }
  end

  def delete_block_response do
    ~s|
      {
        "data": {
          "message": "BLOCKLIST deleted successfully."
        }
      }
    |
  end
end
