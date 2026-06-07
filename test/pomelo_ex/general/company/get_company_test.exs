defmodule PomeloEx.General.Company.GetCompanyTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.CompaniesFixtures
  alias PomeloEx.General.Company.GetCompany

  test "Success 200 - Get Company" do
    payload = CompaniesFixtures.get_company_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/companies/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CompaniesFixtures.get_company_response()
       }}
    end)

    {:ok, response} = GetCompany.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
  end
end
