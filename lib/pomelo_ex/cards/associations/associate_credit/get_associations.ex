defmodule PomeloEx.Cards.Associations.AssociateCredit.GetAssociations do
  @moduledoc false

  alias PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsType

  def execute(%GetAssociationsType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/lending/v1/associations/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
