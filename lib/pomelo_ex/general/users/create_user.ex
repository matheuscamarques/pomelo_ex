defmodule PomeloEx.General.Users.CreateUser do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.General.Authorization

  @idempotency_key_length 14

  defmodule LegalAddress do
    @moduledoc false
    use TypedEctoSchema

    @derive Jason.Encoder
    typed_embedded_schema do
      field(:street_name, :string, enforce: true, null: false)
      field(:street_number, :string, enforce: true, null: false)
      field(:floor, :string)
      field(:apartment, :string)
      field(:zip_code, :string, enforce: true, null: false)
      field(:neighborhood, :string)
      field(:city, :string, enforce: true, null: false)
      field(:region, :string, enforce: true, null: false)
      field(:additional_info, :string)
      field(:country, :string, enforce: true, null: false)
    end
  end

  @derive Jason.Encoder
  typed_embedded_schema do
    field(:name, :string)
    field(:surname, :string)
    field(:identification_type, :string)
    field(:identification_value, :string)
    field(:birthdate, :string)
    field(:gender, :string)
    field(:email, :string, enforce: true, null: false)
    field(:phone, :string)
    field(:tax_identification_type, :string)
    field(:tax_identification_value, :string)
    field(:nationality, :string)
    field(:tax_condition, :string)
    field(:operation_country, :string, enforce: true, null: false)
    embeds_one(:legal_address, LegalAddress)
  end

  def execute(%__MODULE__{} = payload) do
    http_client = Application.get_env(:pomelo_ex, :http_adapter)
    url = Application.get_env(:pomelo_ex, :url)
    headers = build_headers()
    body = Jason.encode!(payload)

    http_client.post("#{url}/users/v1/", body, headers)
  end

  defp build_headers do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = Authorization.request_token()

    token =
      body
      |> Jason.decode!()
      |> Map.fetch!("access_token")

    idempotency_key =
      @idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, @idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
