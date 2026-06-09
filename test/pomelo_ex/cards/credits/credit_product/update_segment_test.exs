defmodule PomeloEx.Cards.Credits.CreditProduct.UpdateSegmentTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.UpdateSegment
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Update Segment" do
    payload = CreditProductFixtures.update_segment_request()

    expect(HTTPMock, :patch, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/segments/lsg-3mkvSzWjc5La6WDTlgFweXAmP23"

      sent_body = Jason.decode!(body)
      assert sent_body["name"] == "Standard Segment"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditProductFixtures.update_segment_response()
       }}
    end)

    {:ok, response} = UpdateSegment.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["name"] == "Standard Segment"
  end
end
