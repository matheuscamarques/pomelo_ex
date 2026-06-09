defmodule PomeloEx.Cards.Credits.CreditLinesV2.UpdateSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.UpdateSegment
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Update Segment" do
    payload = CreditLinesV2Fixtures.update_segment_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/segments/lseg-v2-segment-id"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "Standard Segment"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesV2Fixtures.update_segment_response()
       }}
    end)

    {:ok, response} = UpdateSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["name"] == "Standard Segment"
  end
end
