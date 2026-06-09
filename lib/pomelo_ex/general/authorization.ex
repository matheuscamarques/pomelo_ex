defmodule PomeloEx.General.Authorization do
  @moduledoc """
  OAuth 2.0 authentication for the Pomelo API.

  All requests to Pomelo APIs require a Bearer access token. This module provides
  functions to obtain and revoke tokens using the OAuth 2.0 client credentials flow.

  ## Token usage

  Once obtained, the access token must be included in every API call as an
  `Authorization: Bearer <token>` header. The library handles this automatically
  when you pass the `:token` field in request structs.

  ## Token lifecycle

  Each token is a JWT with a limited expiration time. The same token is returned
  on repeated requests until it expires. When expired, a new token is issued.
  """
  alias PomeloEx.General.Authorization.RequestToken
  alias PomeloEx.General.Authorization.RevokeToken

  @doc """
  Requests a new access token from the Pomelo OAuth 2.0 endpoint.

  Uses the configured `client_id`, `client_secret`, `audience`, and `grant_type`
  from application config. Call this function without arguments to use default
  credentials.

  ## Examples

      # With default credentials from config
      {:ok, %HTTPoison.Response{body: %{"access_token" => token}}} =
        PomeloEx.General.Authorization.request_token()
  """
  def request_token() do
    RequestToken.execute()
  end

  def request_token(payload) do
    RequestToken.execute(payload)
  end

  @doc """
  Revokes an active access token.

  After revocation, the token can no longer be used for API calls.
  A new token can be obtained via `request_token/0` or `request_token/1`.
  """
  def revoke_token(payload) do
    RevokeToken.execute(payload)
  end
end
