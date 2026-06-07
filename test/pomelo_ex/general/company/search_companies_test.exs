defmodule PomeloEx.General.Company.SearchCompaniesTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.CompaniesFixtures
  alias PomeloEx.General.Company.SearchCompanies

  test "Success 200 - Search Companies" do
    payload = CompaniesFixtures.search_companies_request(%{filter_status: "ACTIVE"})

    expect(HTTPMock, :get, fn url, _headers ->
      assert url =~ Application.get_env(:pomelo_ex, :url) <> "/companies/v1/"
      assert url =~ "filter%5Bstatus%5D=ACTIVE"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: CompaniesFixtures.search_companies_response()
       }}
    end)

    {:ok, response} = SearchCompanies.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert Enum.at(body["data"], 0)["id"] == "com-2lWyhVOQarR8I5te2XNXdMleSEu"
  end
end
