defmodule PomeloEx.Cards.Associations.Associations.LinkCardTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Associations.AccountAssociationsFixtures
  alias PomeloEx.Cards.Associations.Associations.LinkCard

  test "Success 201 - Link Card" do
    payload = AccountAssociationsFixtures.link_card_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/cards/associations/v1/"

      sent_body = Jason.decode!(body)
      assert sent_body["card_id"] == "crd-20gRqyp809SvDzXzhSeG2w6UiO5"
      assert sent_body["account_id"] == "acc-20I5vMjljS3VEyafcX8lA3T3g0c"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: AccountAssociationsFixtures.link_card_response()
       }}
    end)

    {:ok, response} = LinkCard.execute(payload)

    body = Jason.decode!(response.body)
    assert body["associated"] == true
  end
end
