defmodule PomeloEx.General.Company.CreateCompany do
  @moduledoc false
  use TypedEctoSchema

  alias PomeloEx.Types.General.Companies.CreateCompanyType

  def execute(%CreateCompanyType{token: token} = payload) do

    headers = build_headers(token)

    body =
      payload
      |> Map.from_struct()
      |> Map.delete(:token)
      |> Jason.encode!()

    PomeloEx.Client.request(:post, "/companies/v1/", body, headers)
  end

  defp build_headers(token) do
    idempotency_key_length = Application.get_env(:pomelo_ex, :idempotency_key_length)

    idempotency_key =
      idempotency_key_length
      |> :crypto.strong_rand_bytes()
      |> Base.encode64(padding: false)
      |> binary_part(0, idempotency_key_length)

    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"x-idempotency-key", idempotency_key}
    ]
  end
end
