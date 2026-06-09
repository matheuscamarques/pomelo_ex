defmodule PomeloEx.Cards.Associations.AccountAssociationsFixtures do
  alias PomeloEx.Types.Cards.Associations.Associations.LinkCardType
  alias PomeloEx.Types.Cards.Associations.Associations.SearchAssociationsType
  alias PomeloEx.Types.Cards.Associations.Associations.UnlinkCardType

  def link_card_request do
    %LinkCardType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      account_id: "acc-20I5vMjljS3VEyafcX8lA3T3g0c"
    }
  end

  def link_card_response do
    ~s|
      {
        "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
        "account_id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
        "associated": true,
        "created_at": "2024-01-01T00:00:00Z",
        "updated_at": "2024-01-01T00:00:00Z"
      }
    |
  end

  def search_associations_request do
    %SearchAssociationsType{
      token: "fRwX12Dg3345AD",
      filter_card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      filter_account_id: nil
    }
  end

  def search_associations_response do
    ~s|
      {
        "data": [
          {
            "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
            "account_id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
            "associated": true,
            "created_at": "2024-01-01T00:00:00Z",
            "updated_at": "2024-01-01T00:00:00Z"
          }
        ],
        "meta": {
          "pagination": {
            "total_pages": 1,
            "current_page": 0
          },
          "filter": [
            {
              "key": "card_id",
              "value": "crd-20gRqyp809SvDzXzhSeG2w6UiO5"
            }
          ]
        }
      }
    |
  end

  def unlink_card_request do
    %UnlinkCardType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      account_id: "acc-20I5vMjljS3VEyafcX8lA3T3g0c"
    }
  end

  def unlink_card_response do
    ~s|
      {
        "card_id": "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
        "account_id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
        "associated": false,
        "created_at": "2024-01-01T00:00:00Z",
        "updated_at": "2024-01-01T00:00:00Z"
      }
    |
  end
end
