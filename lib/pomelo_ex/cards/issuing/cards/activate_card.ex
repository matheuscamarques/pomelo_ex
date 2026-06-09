defmodule PomeloEx.Cards.Issuing.Cards.ActivateCard do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.ActivateCardType

  def execute(%ActivateCardType{token: token} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    PomeloEx.Client.request(:post, "/cards/v1/activation", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
