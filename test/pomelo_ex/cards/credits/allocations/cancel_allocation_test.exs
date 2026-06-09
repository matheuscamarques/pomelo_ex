defmodule PomeloEx.Cards.Credits.Allocations.CancelAllocationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Allocations.CancelAllocation
  alias PomeloEx.Cards.Credits.AllocationsFixtures

  test "Success 200 - Cancel Allocation" do
    payload = AllocationsFixtures.cancel_allocation_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/collections/lco-edeESDira4dpZv8nZ6vwMb8Kjyf/cancel"

      assert body == ""

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AllocationsFixtures.cancel_allocation_response()
       }}
    end)

    {:ok, response} = CancelAllocation.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["status"] == "CANCELLED"
  end
end
