defmodule PomeloEx.Cards.Credits.Statements.SearchAccountStatements do
  @moduledoc false

  alias PomeloEx.Types.Cards.Credits.Statements.SearchAccountStatementsType

  def execute(%SearchAccountStatementsType{token: token, credit_line_id: credit_line_id} = payload) do
    headers = build_headers(token)

    params =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Map.delete(:credit_line_id)
      |> Enum.filter(fn {_k, v} -> not is_nil(v) end)
      |> Enum.map(&format_pair/1)
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    PomeloEx.Client.request(:get, "/lending/v1/credit-lines/#{credit_line_id}/statements/?#{params}", nil, headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp format_pair({:page_size, value}), do: {"page[size]", to_string(value)}
  defp format_pair({:page_number, value}), do: {"page[number]", to_string(value)}
  defp format_pair({key, value}) do
    key = key |> Atom.to_string()
    key = cond do
      key == "filter_status" -> "filter[status]"
      key == "filter_period_from" -> "filter[period][from]"
      key == "filter_period_to" -> "filter[period][to]"
      true -> key
    end
    {key, to_string(value)}
  end
end
