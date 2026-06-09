defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.GetSegment
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Get Segment" do
    payload = CreditLinesV2Fixtures.get_segment_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/segments/lseg-v2-segment-id"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesV2Fixtures.get_segment_response()
       }}
    end)

    {:ok, response} = GetSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == "lseg-v2-segment-id"
  end
end
