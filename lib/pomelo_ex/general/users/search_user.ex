defmodule PomeloEx.General.Users.SearchUser do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.General.Authorization

  @primary_key false
  typed_embedded_schema do
    field(:filter_identification_value, :string)
    field(:filter_identification_type, :string)
    field(:filter_tax_identification_type, :string)
    field(:filter_tax_identification_value, :string)
    field(:filter_gender, :string)
    field(:filter_birthdate, :string)
    field(:filter_name, :string)
    field(:filter_surname, :string)
    field(:filter_email, :string)
    field(:filter_status, :string)
    field(:filter_country_code, :string)
    field(:filter_company_id, :binary_id)
    field(:filter_tax_condition, :string)
    field(:page_size, :integer)
    field(:page_number, :integer)
    field(:sort, {:array, :string})
  end

  def execute(payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers()

    params =
      payload
      |> to_query_params()
      |> URI.encode_query()

    http_client.get("#{url}/users/v1/?#{params}", headers)
  end

  defp build_headers do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = Authorization.request_token()

    token =
      body
      |> Jason.decode!()
      |> Map.fetch!("access_token")

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
  end

  defp to_query_params(%__MODULE__{} = params) do
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
