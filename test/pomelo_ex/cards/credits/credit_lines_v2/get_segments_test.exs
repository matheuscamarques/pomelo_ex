defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetSegmentsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLinesV2.GetSegments
  alias PomeloEx.Cards.Credits.CreditLinesV2Fixtures

  test "Success 200 - Get Segments" do
    payload = CreditLinesV2Fixtures.get_segments_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v2/products/lpr-v2-product-id/segments"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesV2Fixtures.get_segments_response()
       }}
    end)

    {:ok, response} = GetSegments.execute(payload)

    body = Jason.decode!(response.body)
    assert length(body["data"]) == 1
  end
end
