defmodule PomeloEx.Loyalty.ManuallyDebitPointsOrCashbackTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Loyalty.ManuallyDebitPointsOrCashback
  alias PomeloEx.LoyaltyFixtures

  test "Success 200 - Manually Debit Points or Cashback" do
    payload = LoyaltyFixtures.manually_debit_points_or_cashback_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <> "/loyalty/v1/accounts/points/burn"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: LoyaltyFixtures.manually_debit_points_or_cashback_response()
       }}
    end)

    {:ok, response} = ManuallyDebitPointsOrCashback.execute(payload)

    body = Jason.decode!(response.body)
    assert body["points"] == 1000
    assert body["updatedBalance"] == 5000
  end
end
