defmodule PomeloEx.General.Authorization.RequestToken do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:client_id, :string, enforce: true, null: false)
    field(:client_secret, :string, enforce: true, null: false)
    field(:audience, :string, enforce: true, null: false)
    field(:grant_type, :string, enforce: true, null: false)
  end

  def execute do
    %__MODULE__{
      client_id: Application.get_env(:pomelo_ex, :client_id),
      client_secret: Application.get_env(:pomelo_ex, :client_secret),
      audience: Application.get_env(:pomelo_ex, :audience),
      grant_type: Application.get_env(:pomelo_ex, :grant_type)
    }
    |> execute()
  end

  def execute(%__MODULE__{
        client_id: client_id,
        client_secret: client_secret,
        audience: audience,
        grant_type: grant_type
      }) do
    url = Application.get_env(:pomelo_ex, :url)

    headers = [{"Content-Type", "application/json"}]

    body =
      Jason.encode!(%{
        client_id: client_id,
        client_secret: client_secret,
        audience: audience,
        grant_type: grant_type
      })

    HTTPoison.post("#{url}/oauth/token", body, headers)
  end
end
