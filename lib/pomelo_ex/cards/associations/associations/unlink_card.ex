defmodule PomeloEx.Cards.Associations.Associations.UnlinkCard do
  @moduledoc false

  alias PomeloEx.Types.Cards.Associations.Associations.UnlinkCardType

  def execute(%UnlinkCardType{token: token} = payload) do
    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Jason.encode!()

    PomeloEx.Client.request(:delete, "/cards/associations/v1/", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
