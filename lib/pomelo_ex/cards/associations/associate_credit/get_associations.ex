defmodule PomeloEx.Cards.Associations.AssociateCredit.GetAssociations do
  @moduledoc false

  alias PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsType

  def execute(%GetAssociationsType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/lending/v1/associations/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
