defmodule PomeloEx.Cards.Credits.CreditLines.SimulateExpirationDateUpdateTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.SimulateExpirationDateUpdate
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Simulate Expiration Date Update" do
    payload = CreditLinesFixtures.simulate_expiration_date_update_request()

    expect(HTTPMock, :post, fn url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/config/due-date/simulation"

      sent_body = Jason.decode!(body)
      assert sent_body["due_date"] == 28

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CreditLinesFixtures.simulate_expiration_date_update_response()
       }}
    end)

    {:ok, response} = SimulateExpirationDateUpdate.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["new"]["due_date"] == "2022-05-15"
  end
end
