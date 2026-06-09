defmodule PomeloEx.Cards.Credits.CreditProduct.GetSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetSegment
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Segment" do
    payload = CreditProductFixtures.get_segment_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/segments/lsg-3mkvSzWjc5La6WDTlgFweXAmP23"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditProductFixtures.get_segment_response()
       }}
    end)

    {:ok, response} = GetSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["name"] == "Premium Segment"
  end
end
