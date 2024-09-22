defmodule PomeloEx.General.Users.SearchUser do
  @moduledoc false

  alias PomeloEx.Types.General.Users.SearchUserType

  def execute(%SearchUserType{token: token} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers(token)

    params =
      payload
      |> Map.delete(:token)
      |> to_query_params()
      |> URI.encode_query()

    http_client.get("#{url}/users/v1/?#{params}", headers)
  end

  defp build_headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp to_query_params(%SearchUserType{} = params) do
    params
    |> Map.from_struct()
    |> Enum.map(&format_pair/1)
    |> Enum.filter(&is_tuple/1)
    |> Map.new()
  end

  defp format_pair({_key, nil}), do: nil

  defp format_pair({key, value}) do
    {format_key(key), format_value(value)}
  end

  defp format_key(key) do
    key
    |> Atom.to_string()
    |> parse_key_prefix()
  end

  defp parse_key_prefix("filter_" <> rest), do: "filter[#{rest}]"
  defp parse_key_prefix("page_" <> rest), do: "page[#{rest}]"
  defp parse_key_prefix(other), do: other

  defp format_value(value) when is_list(value), do: Enum.join(value, ",")
  defp format_value(value), do: value
end
