defmodule PomeloEx.Cards.StandaloneTokenizationFixtures do
  alias PomeloEx.Types.Cards.Tokenization.Standalone.UpdateTokensStatusByCardIdType

  def update_tokens_status_by_card_id_request do
    %UpdateTokensStatusByCardIdType{
      token: "fRwX12Dg3345AD",
      card_id: "crd-12345",
      status: "SUSPENDED",
      reason: "USER_REQUESTED"
    }
  end

  def update_tokens_status_by_card_id_response do
    ~s|
    {
      "data": {
        "card_id": "crd-12345",
        "status": "SUSPENDED",
        "tokens": [
          {
            "id": "tok-12345",
            "status": "SUSPENDED"
          }
        ]
      }
    }
    |
  end
end
