defmodule PomeloEx.Fraud.SoftBlock.GetSoftBlockStatusTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Fraud.SoftBlock.GetSoftBlockStatus
  alias PomeloEx.Fraud.SoftBlockFixtures

  test "Success 200 - Get Soft Block Status" do
    payload = SoftBlockFixtures.get_soft_block_status_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/fraud/merchant/softblock/FACEBOOK*12345"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: SoftBlockFixtures.get_soft_block_status_response()
       }}
    end)

    {:ok, response} = GetSoftBlockStatus.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["message"] == "FACEBOOK*MARKET"
  end
end
