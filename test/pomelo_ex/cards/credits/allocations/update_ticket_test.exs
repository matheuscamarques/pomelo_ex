defmodule PomeloEx.Cards.Credits.Allocations.UpdateTicketTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.Allocations.UpdateTicket
  alias PomeloEx.Cards.Credits.AllocationsFixtures

  test "Success 200 - Update Ticket" do
    payload = AllocationsFixtures.update_ticket_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :patch, url, body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/payment-requests/lcr-h4xWg6e8CiRcpHd8A6JE8MW8wSZ"

      sent_body = Jason.decode!(body)
      assert sent_body["amount"] == "1000.00"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: AllocationsFixtures.update_ticket_response()
       }}
    end)

    {:ok, response} = UpdateTicket.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["amount"] == "1000.00"
  end
end
