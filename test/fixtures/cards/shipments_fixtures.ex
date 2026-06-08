defmodule PomeloEx.Cards.ShipmentsFixtures do
  alias PomeloEx.Types.Cards.Issuing.ChangeShipmentDataType
  alias PomeloEx.Types.Cards.Issuing.CreateShipmentType
  alias PomeloEx.Types.Cards.Issuing.GetShipmentHistoryType
  alias PomeloEx.Types.Cards.Issuing.GetShipmentType
  alias PomeloEx.Types.Cards.Issuing.RequestReceiverDataType
  alias PomeloEx.Types.Cards.Issuing.SearchShipmentType
  alias PomeloEx.Types.Cards.Issuing.ShipmentNotificationsType

  def create_shipment_request do
    %CreateShipmentType{
      token: "fRwX12Dg3345AD",
      batch_id: "bat-12345",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      address: %{
        "street_name" => "Av. Paulista",
        "street_number" => "1000",
        "zip_code" => "01310-100",
        "region" => "SP"
      }
    }
  end

  def search_shipment_request(params \\ %{}) do
    Map.merge(%SearchShipmentType{token: "fRwX12Dg3345AD"}, params)
  end

  def change_shipment_data_request do
    %ChangeShipmentDataType{
      token: "fRwX12Dg3345AD",
      shipment_id: "shp-12345",
      street_name: "Av. Paulista",
      street_number: "2000",
      zip_code: "01310-200"
    }
  end

  def get_shipment_request do
    %GetShipmentType{
      token: "fRwX12Dg3345AD",
      shipment_id: "shp-12345"
    }
  end

  def get_shipment_history_request do
    %GetShipmentHistoryType{
      token: "fRwX12Dg3345AD",
      shipment_id: "shp-12345"
    }
  end

  def shipment_notifications_request do
    %ShipmentNotificationsType{
      event_id: "evt-12345",
      type: "SHIPMENT_UPDATED",
      data: %{"shipment_id" => "shp-12345", "status" => "IN_TRANSIT"}
    }
  end

  def request_receiver_data_request do
    %RequestReceiverDataType{
      token: "fRwX12Dg3345AD",
      shipment_id: "shp-12345"
    }
  end

  def create_shipment_response do
    ~s|
    {
      "data": {
        "id": "shp-12345",
        "status": "CREATED",
        "batch_id": "bat-12345"
      }
    }
    |
  end

  def search_shipment_response do
    ~s|
    {
      "data": [
        {
          "id": "shp-12345",
          "status": "CREATED",
          "batch_id": "bat-12345"
        }
      ]
    }
    |
  end

  def change_shipment_data_response do
    ~s|
    {
      "data": {
        "id": "shp-12345",
        "status": "CREATED",
        "request_status": "PENDING_UPDATE_ADDRESS"
      }
    }
    |
  end

  def get_shipment_response do
    ~s|
    {
      "data": {
        "id": "shp-12345",
        "status": "IN_TRANSIT",
        "batch_id": "bat-12345",
        "courier": {
          "tracking_number": "TRK-12345",
          "tracking_url": "https://courier.com/track/12345"
        }
      }
    }
    |
  end

  def get_shipment_history_response do
    ~s|
    {
      "data": [
        {
          "status": "CREATED",
          "updated_at": "2026-06-08T00:00:00Z"
        },
        {
          "status": "IN_TRANSIT",
          "updated_at": "2026-06-08T04:00:00Z"
        }
      ]
    }
    |
  end

  def request_receiver_data_response do
    ~s|
    {
      "data": {
        "shipment_id": "shp-12345",
        "request_status": "REQUESTED_RECEIVER_DATA"
      }
    }
    |
  end
end
