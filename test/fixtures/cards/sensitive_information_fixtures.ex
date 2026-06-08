defmodule PomeloEx.Cards.SensitiveInformationFixtures do
  alias PomeloEx.Types.Cards.SensitiveInformation.Authorization.CreateUserTokenType
  alias PomeloEx.Types.Cards.SensitiveInformation.Handling.ActivateCardType
  alias PomeloEx.Types.Cards.SensitiveInformation.Handling.DisplaySensitiveInformationType

  def create_user_token_request do
    %CreateUserTokenType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-12345"
    }
  end

  def display_sensitive_information_request do
    %DisplaySensitiveInformationType{
      card_id: "crd-12345",
      auth: "usr_tok-12345",
      layout: "card",
      locale: "es",
      field_list: ["pan", "expiration", "code"]
    }
  end

  def activate_card_request do
    %ActivateCardType{
      card_id: "crd-12345",
      auth: "usr_tok-12345",
      locale: "es",
      success_link: "https://my-app.com/success"
    }
  end

  def create_user_token_response do
    ~s|
    {
      "data": {
        "token": "usr_tok-12345",
        "expires_in": 900
      }
    }
    |
  end
end
