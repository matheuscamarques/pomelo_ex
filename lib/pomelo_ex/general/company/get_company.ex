defmodule PomeloEx.General.Company.GetCompany do
  @moduledoc false

  alias PomeloEx.Types.General.Companies.GetCompanyType

  def execute(%GetCompanyType{id: id, token: token}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/companies/v1/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
