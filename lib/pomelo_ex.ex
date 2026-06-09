defmodule PomeloEx do
  @moduledoc """
  `PomeloEx` is an Elixir client library for the [Pomelo API](https://developers.pomelo.la).

  Pomelo is a Latin American fintech platform that provides card issuing, digital accounts,
  identity verification (KYC/KYB), fraud prevention, loyalty programs, credit products, and more.

  ## Architecture

  This library follows a three-layer design pattern:

  1. **Parent modules** (e.g. `PomeloEx.General.Company`) — expose public functions via `defdelegate`
  2. **Operation modules** — implement HTTP calls via `execute/1` (hidden from public docs)
  3. **Type modules** — define typed request schemas using `TypedEctoSchema` (hidden from public docs)

  ## Usage

  Before making API calls, you must configure the library with your Pomelo credentials:

  ```elixir
  config :pomelo_ex,
    client_id: "your_client_id",
    client_secret: "your_client_secret",
    url: "https://api.pomelo.la",
    audience: "https://api.pomelo.la",
    grant_type: "client_credentials"
  ```

  ### Authentication

  Obtain an access token via `PomeloEx.General.Authorization.request_token/0`:

  ```elixir
  {:ok, %HTTPoison.Response{body: body}} = PomeloEx.General.Authorization.request_token()
  token = body["access_token"]
  ```

  ### Making API calls

  Pass the token within each request struct:

  ```elixir
  payload = %PomeloEx.Types.General.Companies.CreateCompanyType{
    token: token,
    legal_name: "My Company",
    email: "contact@company.com",
    operation_country: "ARG"
  }

  {:ok, response} = PomeloEx.General.Company.create_company(payload)
  ```

  ### Sandbox environment

  For development, use the sandbox environment:

  ```elixir
  config :pomelo_ex,
    url: "https://sandbox.api.pomelo.la",
    ...
  ```

  ## Configuration

  | Key | Description | Default |
  |-----|-------------|---------|
  | `:http_adapter` | HTTP client module | `HTTPoison` |
  | `:url` | API base URL | — |
  | `:client_id` | OAuth client ID | — |
  | `:client_secret` | OAuth client secret | — |
  | `:audience` | OAuth audience | — |
  | `:grant_type` | OAuth grant type | — |
  | `:idempotency_key_length` | Length of generated idempotency keys | — |

  ## Domains

  - `PomeloEx.General.Authorization` — OAuth 2.0 token management
  - `PomeloEx.General.Company` — Company management
  - `PomeloEx.General.Users` — User management
  - `PomeloEx.Identity.KYC` — Know Your Customer sessions
  - `PomeloEx.Identity.KYB` — Know Your Business sessions
  - `PomeloEx.Cards.Issuing` — Card issuance lifecycle
  - `PomeloEx.Cards.Processing` — Transaction authorization and presentment
  - `PomeloEx.Cards.Tokenization` — Digital wallet tokenization
  - `PomeloEx.Cards.SensitiveInformation` — Sensitive data handling
  - `PomeloEx.Cards.Credits` — Credit products and lines
  - `PomeloEx.Cards.Associations` — Card-credit line associations
  - `PomeloEx.DigitalAccounts` — Digital account management
  - `PomeloEx.Finance.Settlements` — Settlement operations
  - `PomeloEx.Fraud` — Fraud prevention operations
  - `PomeloEx.FraudPrevention` — Legacy fraud prevention
  - `PomeloEx.Loyalty` — Loyalty points and cashback
  """
end
