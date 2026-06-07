defmodule PomeloEx.General.Company.ModifyCompanyTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.CompaniesFixtures
  alias PomeloEx.General.Company.ModifyCompany

  test "Success 200 - Modify Company" do
    payload = CompaniesFixtures.modify_company_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/companies/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CompaniesFixtures.modify_company_response()
       }}
    end)

    {:ok, response} = ModifyCompany.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["status"] == payload.status
  end
end
