defmodule PomeloEx.Cards.CardsFixtures do
  alias PomeloEx.Types.Cards.Issuing.ActivateCardType
  alias PomeloEx.Types.Cards.Issuing.CardEventsType
  alias PomeloEx.Types.Cards.Issuing.CreateBatchInnominateCardsType
  alias PomeloEx.Types.Cards.Issuing.CreateCardType
  alias PomeloEx.Types.Cards.Issuing.CreateMultipleBatchInnominateCardsType
  alias PomeloEx.Types.Cards.Issuing.GetAffinityGroupType
  alias PomeloEx.Types.Cards.Issuing.GetCardType
  alias PomeloEx.Types.Cards.Issuing.SearchCardsType
  alias PomeloEx.Types.Cards.Issuing.UpdateCardBatchShippingType
  alias PomeloEx.Types.Cards.Issuing.UpdateCardShippingType
  alias PomeloEx.Types.Cards.Issuing.UpdateCardType

  def create_card_request do
    %CreateCardType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-2lWyhVOQarR8I5te2XNXdMleSEu",
      affinity_group_id: "aff-12345",
      card_type: "PHYSICAL"
    }
  end

  def search_cards_request(params \\ %{}) do
    Map.merge(%SearchCardsType{token: "fRwX12Dg3345AD"}, params)
  end

  def get_card_request do
    %GetCardType{
      token: "fRwX12Dg3345AD",
      id: "crd-12345"
    }
  end

  def update_card_request do
    %UpdateCardType{
      token: "fRwX12Dg3345AD",
      id: "crd-12345",
      status: "BLOCKED",
      status_reason: "CLIENT_INTERNAL_REASON"
    }
  end

  def activate_card_request do
    %ActivateCardType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-12345",
      pin: "1234"
    }
  end

  def card_events_request do
    %CardEventsType{
      event_id: "evt-12345",
      type: "ACTIVATION",
      data: %{"card_id" => "crd-12345"}
    }
  end

  def update_card_shipping_request do
    %UpdateCardShippingType{
      token: "fRwX12Dg3345AD",
      id: "crd-12345",
      street_name: "Av. Paulista",
      street_number: "1000",
      zip_code: "01310-100"
    }
  end

  def create_batch_innominate_cards_request do
    %CreateBatchInnominateCardsType{
      token: "fRwX12Dg3345AD",
      affinity_group_id: "aff-12345",
      quantity: 100
    }
  end

  def create_multiple_batch_innominate_cards_request do
    %CreateMultipleBatchInnominateCardsType{
      token: "fRwX12Dg3345AD",
      batches: [%{"affinity_group_id" => "aff-12345", "quantity" => 100}]
    }
  end

  def update_card_batch_shipping_request do
    %UpdateCardBatchShippingType{
      token: "fRwX12Dg3345AD",
      shipment_id: "shp-12345",
      street_name: "Av. Paulista",
      street_number: "1000",
      zip_code: "01310-100"
    }
  end

  def get_affinity_group_request do
    %GetAffinityGroupType{
      token: "fRwX12Dg3345AD",
      id: "aff-12345"
    }
  end

  def create_card_response do
    ~s|
        {
          "data": {
            "id": "crd-12345",
            "status": "CREATED",
            "card_type": "PHYSICAL",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
          }
        }
    |
  end

  def get_card_response do
    ~s|
        {
          "data": {
            "id": "crd-12345",
            "status": "ACTIVE",
            "card_type": "PHYSICAL",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
          }
        }
    |
  end

  def search_cards_response do
    ~s|
        {
          "data": [
            {
              "id": "crd-12345",
              "status": "ACTIVE",
              "card_type": "PHYSICAL",
              "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
            }
          ]
        }
    |
  end

  def update_card_response do
    ~s|
        {
          "data": {
            "id": "crd-12345",
            "status": "BLOCKED",
            "card_type": "PHYSICAL",
            "user_id": "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
          }
        }
    |
  end

  def activate_card_response do
    ~s|
        {
          "data": {
            "id": "crd-12345",
            "status": "ACTIVE"
          }
        }
    |
  end

  def update_card_shipping_response do
    ~s|
        {
          "data": {
            "id": "crd-12345",
            "shipment_id": "shp-12345"
          }
        }
    |
  end

  def create_batch_innominate_cards_response do
    ~s|
        {
          "data": {
            "batch_id": "bat-12345",
            "status": "PROCESSING"
          }
        }
    |
  end

  def create_multiple_batch_innominate_cards_response do
    ~s|
        {
          "data": {
            "bulk_id": "blk-12345",
            "status": "PROCESSING"
          }
        }
    |
  end

  def update_card_batch_shipping_response do
    ~s|
        {
          "data": {
            "shipment_id": "shp-12345",
            "status": "UPDATED"
          }
        }
    |
  end

  def get_affinity_group_response do
    ~s|
        {
          "data": {
            "id": "aff-12345",
            "name": "Default Affinity Group"
          }
        }
    |
  end
end
