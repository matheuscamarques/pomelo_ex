defmodule PomeloEx.Cards.Credits.CreditProduct.GetSegmentsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetSegments
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Segments" do
    payload = CreditProductFixtures.get_segments_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/segments"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.get_segments_response()
       }}
    end)

    {:ok, response} = GetSegments.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("name") == "Premium Segment"
  end
end
