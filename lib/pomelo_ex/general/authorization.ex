defmodule PomeloEx.General.Authorization do
  @moduledoc """
  Authorization
  We implemented the OAuth 2.0 standard so you can communicate with our APIs with a single Bearer token.

  Using the token#
  Once you receive the access token, you must include it as an authorization header every time you communicate with our APIs.

  Example in Curl:

  curl https://api.pomelo.la -H 'Authorization: Bearer eyJhbGciOiJSUzI1Ni'
  Each API validates the access token and verifies that the scope matches the required permissions.

  For the requests to be valid, communicate with our APIs only via HTTPS and include the authorization header indicating that it is a Bearer type.
  """
  alias PomeloEx.General.Authorization.RequestToken
  alias PomeloEx.General.Authorization.RevokeToken

  @doc """
  Request token
  The endpoint /oauth/token is used to obtain an access token. When performing a successful authentication, be sure to save it as you will need it to communicate with our APIs.

  Each token is a JWT that contains an expiration time. We will return the same token to you each time you request one, until it expires. When it expires, we will provide a new one.
  """
  defdelegate request_token(payload), to: RequestToken, as: :execute

  @doc """
  Revoke token
  The '/oauth/token/revoke' endpoint is used to revoke an access token from our cache. By revoking the token you can request a new one with the '/oauth/token' endpoint
  """
  defdelegate revoke_token(payload), to: RevokeToken, as: :execute
end
