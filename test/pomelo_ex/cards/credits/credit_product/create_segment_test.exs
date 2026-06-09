defmodule PomeloEx.Cards.Credits.CreditProduct.CreateSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.CreateSegment
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 201 - Create Segment" do
    payload = CreditProductFixtures.create_segment_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/segments"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "Premium Segment"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: CreditProductFixtures.create_segment_response()
       }}
    end)

    {:ok, response} = CreateSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lsg-3mkvSzWjc5La6WDTlgFweXAmP23"
  end
end
