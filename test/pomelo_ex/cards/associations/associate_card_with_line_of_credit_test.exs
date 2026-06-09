defmodule PomeloEx.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCreditTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCredit
  alias PomeloEx.Cards.Associations.LineAssociationsFixtures

  test "Success 201 - Associate Card with Line of Credit" do
    payload = LineAssociationsFixtures.associate_card_with_line_of_credit_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/lending/v1/associations"

      sent_body = Jason.decode!(body)
      assert sent_body["card_id"] == "crd-20gRqyp809SvDzXzhSeG2w6UiO5"
      assert sent_body["credit_line_id"] == "lcr-20MpN8vmIPj77ujhb9cS8ctstN2"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: LineAssociationsFixtures.associate_card_with_line_of_credit_response()
       }}
    end)

    {:ok, response} = AssociateCardWithLineOfCredit.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lca-20gRqyp809SvDzXzhSeG2w6UiO5"
  end
end
