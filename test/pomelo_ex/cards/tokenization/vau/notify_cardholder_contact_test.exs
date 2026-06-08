defmodule PomeloEx.Cards.Tokenization.VAU.NotifyCardholderContactTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Tokenization.VAU.NotifyCardholderContact
  alias PomeloEx.Cards.VAUFixtures

  test "Success 200 - Notify Cardholder Contact" do
    payload = VAUFixtures.notify_cardholder_contact_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/pan-lifecycle/contact-cardholder"

      decoded_body = Jason.decode!(body)
      assert decoded_body["card_id"] == payload.card_id
      assert decoded_body["operator_id"] == payload.operator_id

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: VAUFixtures.vau_success_response()
       }}
    end)

    {:ok, response} = NotifyCardholderContact.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "SUCCESS"
  end
end
