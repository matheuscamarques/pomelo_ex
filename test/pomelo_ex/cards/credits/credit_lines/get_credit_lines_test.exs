defmodule PomeloEx.Cards.Credits.CreditLines.GetCreditLinesTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.Cards.Credits.CreditLines.GetCreditLines
  alias PomeloEx.Cards.Credits.CreditLinesFixtures

  test "Success 200 - Get Credit Lines" do
    payload = CreditLinesFixtures.get_credit_lines_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :get, url, _body, _headers ->
      assert url ==
               Application.get_env(:pomelo_ex, :url) <>
                 "/lending/v1/credit-lines/?filter[status]=ACTIVE"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: CreditLinesFixtures.get_credit_lines_response()
       }}
    end)

    {:ok, response} = GetCreditLines.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"] |> List.first() |> Map.get("id") == "lcr-2HMwKzetERdOEhbT86UweXamPle"
  end
end
