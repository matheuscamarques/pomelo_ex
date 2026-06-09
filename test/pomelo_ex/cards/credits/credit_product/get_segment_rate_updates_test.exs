defmodule PomeloEx.Cards.Credits.CreditProduct.GetSegmentRateUpdatesTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditProduct.GetSegmentRateUpdates
  alias PomeloEx.Cards.Credits.CreditProductFixtures

  test "Success 200 - Get Segment Rate Updates" do
    payload = CreditProductFixtures.get_segment_rate_updates_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/products/lpr-2HMvSzWjc5La6WDTlgFweXAmPle/segments/lsg-3mkvSzWjc5La6WDTlgFweXAmP23/pricing"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditProductFixtures.get_segment_rate_updates_response()
       }}
    end)

    {:ok, response} = GetSegmentRateUpdates.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("start_date") == "2022-04-30"
  end
end
