defmodule PomeloEx.Cards.Credits.Hierarchies.GetNodeTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Hierarchies.GetNode
  alias PomeloEx.Cards.Credits.HierarchiesFixtures

  test "Success 200 - Get Node" do
    payload = HierarchiesFixtures.get_node_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/hierarchies/hie-2HMwKzetERdOEhbT86UweXamPle/nodes/nod-2HMwKzetERdOEhbT86UweXamPle"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: HierarchiesFixtures.get_node_response()
       }}
    end)

    {:ok, response} = GetNode.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "PENDING"
  end
end
