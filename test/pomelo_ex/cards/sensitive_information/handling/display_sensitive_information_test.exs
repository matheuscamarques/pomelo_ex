defmodule PomeloEx.Cards.SensitiveInformation.Handling.DisplaySensitiveInformationTest do
  use ExUnit.Case

  alias PomeloEx.Cards.SensitiveInformation.Handling.DisplaySensitiveInformation
  alias PomeloEx.Cards.SensitiveInformationFixtures

  test "Success - Display Sensitive Information URL" do
    payload = SensitiveInformationFixtures.display_sensitive_information_request()

    {:ok, url} = DisplaySensitiveInformation.execute(payload)

    assert url =~ "https://pomelo.la/secure-data/crd-12345?"
    assert url =~ "auth=usr_tok-12345"
    assert url =~ "layout=card"
    assert url =~ "locale=es"
    assert url =~ "field_list=pan%2Cexpiration%2Ccode"
  end
end
