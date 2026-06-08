defmodule PomeloEx.Cards.SensitiveInformation.Handling.ActivateCardTest do
  use ExUnit.Case

  alias PomeloEx.Cards.SensitiveInformation.Handling.ActivateCard
  alias PomeloEx.Cards.SensitiveInformationFixtures

  test "Success - Activate Card Web URL" do
    payload = SensitiveInformationFixtures.activate_card_request()

    {:ok, url} = ActivateCard.execute(payload)

    assert url =~ "https://pomelo.la/secure-data/activation/crd-12345?"
    assert url =~ "auth=usr_tok-12345"
    assert url =~ "locale=es"
    assert url =~ "success_link=https%3A%2F%2Fmy-app.com%2Fsuccess"
  end
end
