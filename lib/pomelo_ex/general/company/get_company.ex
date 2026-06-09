defmodule PomeloEx.General.Company.GetCompany do
  @moduledoc false

  alias PomeloEx.Types.General.Companies.GetCompanyType

  def execute(%GetCompanyType{id: id, token: token}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/companies/v1/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
