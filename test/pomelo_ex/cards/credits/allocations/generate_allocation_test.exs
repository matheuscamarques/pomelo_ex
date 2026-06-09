defmodule PomeloEx.Cards.Credits.Allocations.GenerateAllocationTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Allocations.GenerateAllocation
  alias PomeloEx.Cards.Credits.AllocationsFixtures

  test "Success 201 - Generate Allocation" do
    payload = AllocationsFixtures.generate_allocation_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/lending/v1/collections"

      sent_body = Jason.decode!(body)
      assert sent_body["credit_line_id"] == "lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ"
      assert sent_body["type"] == "PAYMENT"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: AllocationsFixtures.generate_allocation_response()
       }}
    end)

    {:ok, response} = GenerateAllocation.execute(payload)

    body = Jason.decode!(response.body)
    assert body["id"] == "lco-edeESDira4dpZv8nZ6vwMb8Kjyf"
  end
end
