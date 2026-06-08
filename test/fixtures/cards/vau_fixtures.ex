defmodule PomeloEx.Cards.VAUFixtures do
  alias PomeloEx.Types.Cards.Tokenization.VAU.DisableVauForACardType
  alias PomeloEx.Types.Cards.Tokenization.VAU.EnableVauForACardType
  alias PomeloEx.Types.Cards.Tokenization.VAU.NotifyAccountClosureType
  alias PomeloEx.Types.Cards.Tokenization.VAU.NotifyCardholderContactType

  def enable_vau_for_a_card_request do
    %EnableVauForACardType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      operator_id: "operator-123"
    }
  end

  def disable_vau_for_a_card_request do
    %DisableVauForACardType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      operator_id: "operator-123"
    }
  end

  def notify_cardholder_contact_request do
    %NotifyCardholderContactType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      operator_id: "operator-123"
    }
  end

  def notify_account_closure_request do
    %NotifyAccountClosureType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-20gRqyp809SvDzXzhSeG2w6UiO5",
      operator_id: "operator-123"
    }
  end

  def vau_success_response do
    ~s|
    {
      "data": {
        "status": "SUCCESS"
      }
    }
    |
  end
end
