defmodule PomeloEx.Cards.Credits.Hierarchies.CreateNodeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Hierarchies.CreateNode
  alias PomeloEx.Cards.Credits.HierarchiesFixtures

  test "Success 201 - Create Node" do
    payload = HierarchiesFixtures.create_node_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/hierarchies/hie-2HMwKzetERdOEhbT86UweXamPle/nodes"

      sent_body = Jason.decode!(body)
      assert sent_body["type"] == "COMPANY_AREA"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: HierarchiesFixtures.create_node_response()
       }}
    end)

    {:ok, response} = CreateNode.execute(payload)

    body = Jason.decode!(response.body)
    assert body["id"] == "nod-2HMwKzetERdOEhbT86UweXamPle"
  end
end
