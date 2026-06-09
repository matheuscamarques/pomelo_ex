defmodule PomeloEx.General.Users.ListCustomFieldMappings do
  @moduledoc false

  alias PomeloEx.Types.General.Users.ListCustomFieldMappingsType

  def execute(%ListCustomFieldMappingsType{token: token}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/users/v1/custom-fields/mappings", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
