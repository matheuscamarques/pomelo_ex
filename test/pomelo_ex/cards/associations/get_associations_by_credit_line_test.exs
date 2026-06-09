defmodule PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsByCreditLineTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsByCreditLine
  alias PomeloEx.Cards.Associations.LineAssociationsFixtures

  test "Success 200 - Get Associations by Credit Line" do
    payload = LineAssociationsFixtures.get_associations_by_credit_line_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/associations?filter[credit_line_id]=lcr-20MpN8vmIPj77ujhb9cS8ctstN2"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: LineAssociationsFixtures.get_associations_by_credit_line_response()
       }}
    end)

    {:ok, response} = GetAssociationsByCreditLine.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
