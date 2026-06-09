defmodule PomeloEx.Cards.Credits.Hierarchies.UpdateNodeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Hierarchies.UpdateNode
  alias PomeloEx.Cards.Credits.HierarchiesFixtures

  test "Success 200 - Update Node" do
    payload = HierarchiesFixtures.update_node_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/hierarchies/hie-2HMwKzetERdOEhbT86UweXamPle/nodes/nod-2HMwKzetERdOEhbT86UweXamPle"

      sent_body = Jason.decode!(body)
      assert sent_body["status"] == "ACTIVE"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: HierarchiesFixtures.update_node_response()
       }}
    end)

    {:ok, response} = UpdateNode.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "ACTIVE"
  end
end
