defmodule PomeloEx.Cards.Credits.CreditLinesV2.CreateSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.CreateSegment
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 201 - Create Segment" do
    payload = CreditLinesV2Fixtures.create_segment_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/segments"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "Premium Segment"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: CreditLinesV2Fixtures.create_segment_response()
       }}
    end)

    {:ok, response} = CreateSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lseg-v2-segment-id"
  end
end
