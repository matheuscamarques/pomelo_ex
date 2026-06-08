defmodule PomeloEx.Cards.Issuing.Cards.UpdateCard do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.UpdateCardType

  def execute(%UpdateCardType{token: token, id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:id)
      |> Enum.reject(fn {_, v} -> v == nil end)
      |> Enum.into(%{})
      |> Jason.encode!()

    http_client.patch("#{url}/cards/v1/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
