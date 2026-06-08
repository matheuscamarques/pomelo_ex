defmodule PomeloEx.Cards.ClickToPayFixtures do
  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.GetStatusType
  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.OptInType
  alias PomeloEx.Types.Cards.Tokenization.ClickToPay.OptOutType

  def opt_in_request do
    %OptInType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-12345",
      email: "user@example.com",
      phone_number: "+5511999999999"
    }
  end

  def opt_out_request do
    %OptOutType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-12345",
      reason: "USER_REQUESTED"
    }
  end

  def get_status_request do
    %GetStatusType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-12345"
    }
  end

  def opt_in_response do
    ~s|
    {
      "data": {
        "id": "crd-12345",
        "status": "ENROLLING"
      }
    }
    |
  end

  def opt_out_response do
    ~s|
    {
      "data": {
        "id": "crd-12345",
        "status": "DISENROLLING"
      }
    }
    |
  end

  def get_status_response do
    ~s|
    {
      "data": {
        "id": "crd-12345",
        "status": "ENROLLED",
        "last_updated": "2026-06-08T00:00:00Z"
      }
    }
    |
  end
end
