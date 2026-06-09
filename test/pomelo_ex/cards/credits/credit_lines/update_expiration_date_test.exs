defmodule PomeloEx.Cards.Credits.CreditLines.UpdateExpirationDateTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.UpdateExpirationDate
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Update Expiration Date" do
    payload = CreditLinesFixtures.update_expiration_date_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/lcr-2HMwKzetERdOEhbT86UweXamPle/config/due-date"

      sent_body = Jason.decode!(body)
      assert sent_body["due_date"] == 28

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesFixtures.update_expiration_date_response()
       }}
    end)

    {:ok, response} = UpdateExpirationDate.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["due_date"] == 28
  end
end
