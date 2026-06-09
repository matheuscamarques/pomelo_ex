defmodule PomeloEx.General.Company.ModifyCompany do
  @moduledoc false
  alias PomeloEx.Types.General.Companies.ModifyCompanyType

  def execute(%ModifyCompanyType{id: id, token: token} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/companies/v1/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
