defmodule PomeloEx.Cards.TokenizationFixtures do
  alias PomeloEx.Types.Cards.Tokenization.DeleteTokenType
  alias PomeloEx.Types.Cards.Tokenization.GetTokenByIdType
  alias PomeloEx.Types.Cards.Tokenization.GetTokensByCardIdType
  alias PomeloEx.Types.Cards.Tokenization.SuspendTokenType
  alias PomeloEx.Types.Cards.Tokenization.UnsuspendTokenType

  def get_token_by_id_request do
    %GetTokenByIdType{
      token: "fRwX12Dg3345AD",
      external_token_id: "tok-12345"
    }
  end

  def suspend_token_request do
    %SuspendTokenType{
      token: "fRwX12Dg3345AD",
      external_token_id: "tok-12345",
      reason: "USER_REQUESTED"
    }
  end

  def unsuspend_token_request do
    %UnsuspendTokenType{
      token: "fRwX12Dg3345AD",
      external_token_id: "tok-12345",
      reason: "USER_REQUESTED"
    }
  end

  def delete_token_request do
    %DeleteTokenType{
      token: "fRwX12Dg3345AD",
      external_token_id: "tok-12345",
      reason: "CARD_EXPIRED"
    }
  end

  def get_tokens_by_card_id_request do
    %GetTokensByCardIdType{
      token: "fRwX12Dg3345AD",
      external_card_id: "crd-12345",
      filter_token_status: "ACTIVE"
    }
  end

  def token_response do
    ~s|
    {
      "data": {
        "id": "tok-12345",
        "card_id": "crd-12345",
        "status": "ACTIVE",
        "token_requestor_id": "01234567890"
      }
    }
    |
  end

  def suspend_token_response do
    ~s|
    {
      "data": {
        "id": "tok-12345",
        "status": "SUSPENDED"
      }
    }
    |
  end

  def unsuspend_token_response do
    ~s|
    {
      "data": {
        "id": "tok-12345",
        "status": "ACTIVE"
      }
    }
    |
  end

  def delete_token_response do
    ~s|
    {
      "data": {
        "id": "tok-12345",
        "status": "DELETED"
      }
    }
    |
  end

  def get_tokens_by_card_id_response do
    ~s|
    {
      "data": [
        {
          "id": "tok-12345",
          "card_id": "crd-12345",
          "status": "ACTIVE",
          "token_requestor_id": "01234567890"
        }
      ]
    }
    |
  end
end
