defmodule PomeloEx.Loyalty.ManuallyCreditPointsOrCashbackTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Loyalty.ManuallyCreditPointsOrCashback
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Manually Credit Points or Cashback" do
    payload = LoyaltyFixtures.manually_credit_points_or_cashback_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/loyalty/v1/accounts/points/mint"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: LoyaltyFixtures.manually_credit_points_or_cashback_response()
       }}
    end)

    {:ok, response} = ManuallyCreditPointsOrCashback.execute(payload)

    body = Jason.decode!(response.body)
    assert body["points"] == 1000
    assert body["updatedBalance"] == 5000
  end
end
