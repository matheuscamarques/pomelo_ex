defmodule PomeloEx.Cards.Credits.CreditProduct.UpdateProduct do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditProduct.UpdateProductType

  def execute(%UpdateProductType{token: token, id: id} = payload) do
    headers = build_headers(token)

    body = payload.body |> Jason.encode!()

    PomeloEx.Client.request(:patch, "/lending/v1/products/#{id}", body, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end
end
