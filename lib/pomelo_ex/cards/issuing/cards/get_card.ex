defmodule PomeloEx.Cards.Issuing.Cards.GetCard do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.GetCardType

  def execute(%GetCardType{token: token, id: id}) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    http_client.get("#{url}/cards/v1/#{id}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
