defmodule PomeloEx.Cards.Issuing.Cards.GetAffinityGroupTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.CardsFixtures
  alias PomeloEx.Cards.Issuing.Cards.GetAffinityGroup

  test "Success 200 - Get Affinity Group" do
    payload = CardsFixtures.get_affinity_group_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/config/affinity-groups/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CardsFixtures.get_affinity_group_response()
       }}
    end)

    {:ok, response} = GetAffinityGroup.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["name"] == "Default Affinity Group"
  end
end
