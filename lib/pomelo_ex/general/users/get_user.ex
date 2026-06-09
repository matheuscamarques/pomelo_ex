defmodule PomeloEx.General.Users.GetUser do
  @moduledoc false

  alias PomeloEx.Types.General.Users.GetUserType

  def execute(%GetUserType{id: id, token: token}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/users/v1/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
