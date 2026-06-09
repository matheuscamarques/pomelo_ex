defmodule PomeloEx.Cards.Associations.Associations.SearchAssociationsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Associations.Associations.SearchAssociations
  alias PomeloEx.Cards.Associations.AccountAssociationsFixtures

  test "Success 200 - Search Associations" do
    payload = AccountAssociationsFixtures.search_associations_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/cards/associations/v1/?filter[card_id]=crd-20gRqyp809SvDzXzhSeG2w6UiO5"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AccountAssociationsFixtures.search_associations_response()
       }}
    end)

    {:ok, response} = SearchAssociations.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
