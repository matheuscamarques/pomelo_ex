defmodule PomeloEx.Cards.Issuing.Cards.UpdateCardShipping do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.UpdateCardShippingType

  def execute(%UpdateCardShippingType{token: token, id: id} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/cards/v1/#{id}/shipment", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
