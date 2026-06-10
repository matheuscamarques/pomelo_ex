defmodule PomeloEx.Cards.Credits.CreditLinesV2.GetProducts do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.CreditLinesV2.GetProductsType

  def execute(%GetProductsType{token: token} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Map.new()
      |> URI.encode_query()

    PomeloEx.Client.request(:get, "/lending/v2/products/?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:page_number, value}), do: {"page[number]", to_string(value)}
  defp format_pair({:page_size, value}), do: {"page[size]", to_string(value)}

  defp format_pair({key, value}) do
    key =
      key |> Atom.to_string() |> String.replace("filter_", "filter.") |> String.replace("_", ".")

    {key, to_string(value)}
  end
end
