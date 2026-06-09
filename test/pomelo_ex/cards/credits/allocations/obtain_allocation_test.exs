defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocation
  alias PomeloEx.Cards.Credits.AllocationsFixtures

  test "Success 200 - Obtain Allocation" do
    payload = AllocationsFixtures.obtain_allocation_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/collections/lco-edeESDira4dpZv8nZ6vwMb8Kjyf"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: AllocationsFixtures.obtain_allocation_response()
       }}
    end)

    {:ok, response} = ObtainAllocation.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "CREATED"
  end
end
