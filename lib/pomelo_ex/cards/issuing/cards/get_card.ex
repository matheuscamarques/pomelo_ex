defmodule PomeloEx.Cards.Issuing.Cards.GetCard do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetCardType

  def execute(%GetCardType{token: token, id: id}) do
    headers = build_headers(token)

    PomeloEx.Client.request(:get, "/cards/v1/#{id}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
