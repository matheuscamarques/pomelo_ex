defmodule PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsByCreditLine do
  @moduledoc false

  alias PomeloEx.Types.Cards.Associations.AssociateCredit.GetAssociationsByCreditLineType

  def execute(%GetAssociationsByCreditLineType{token: token} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    http_client.get("#{url}/lending/v1/associations?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:filter_credit_line_id, value}), do: {"filter[credit_line_id]", to_string(value)}
end
