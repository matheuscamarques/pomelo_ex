defmodule PomeloEx.General.Company.CreateCompanyTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.CompaniesFixtures
  alias PomeloEx.General.Company.CreateCompany

  test "Success 201 - Create Company" do
    payload = CompaniesFixtures.create_company_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/companies/v1/"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 201,
         body: CompaniesFixtures.create_company_response()
       }}
    end)

    {:ok, response} = CreateCompany.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["email"] == payload.email
  end
end
