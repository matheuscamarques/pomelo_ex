defmodule PomeloEx.Cards.Credits.CreditProduct.UpdateProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.UpdateProductType

  def execute(%UpdateProductType{token: token, id: id} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    http_client.patch("#{url}/lending/v1/products/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
