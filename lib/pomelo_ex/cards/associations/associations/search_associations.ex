defmodule PomeloEx.Cards.Associations.Associations.SearchAssociations do
  @moduledoc false

  alias PomeloEx.Types.Cards.Associations.Associations.SearchAssociationsType

  def execute(%SearchAssociationsType{token: token} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    PomeloEx.Client.request(:get, "/cards/associations/v1/?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:filter_card_id, value}), do: {"filter[card_id]", to_string(value)}
  defp format_pair({:filter_account_id, value}), do: {"filter[account_id]", to_string(value)}
end
