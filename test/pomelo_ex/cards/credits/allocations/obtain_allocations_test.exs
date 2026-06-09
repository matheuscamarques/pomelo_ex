defmodule PomeloEx.Cards.Credits.Allocations.ObtainAllocationsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocations
  alias PomeloEx.Cards.Credits.AllocationsFixtures

  test "Success 200 - Obtain Allocations" do
    payload = AllocationsFixtures.obtain_allocations_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/collections/?filter[credit_line_id]=lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: AllocationsFixtures.obtain_allocations_response()
       }}
    end)

    {:ok, response} = ObtainAllocations.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
