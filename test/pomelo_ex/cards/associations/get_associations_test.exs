defmodule PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociations
  alias PomeloEx.Cards.Associations.LineAssociationsFixtures

  test "Success 200 - Get Associations by Id" do
    payload = LineAssociationsFixtures.get_associations_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/associations/lca-20gRqyp809SvDzXzhSeG2w6UiO5"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: LineAssociationsFixtures.get_associations_response()
       }}
    end)

    {:ok, response} = GetAssociations.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lca-20gRqyp809SvDzXzhSeG2w6UiO5"
  end
end
