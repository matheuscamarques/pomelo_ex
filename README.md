# PomeloEx

[![Module Version](https://img.shields.io/hexpm/v/pomelo_ex.svg)](https://hex.pm/packages/pomelo_ex)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/pomelo_ex/)
[![License](https://img.shields.io/hexpm/l/pomelo_ex.svg)](https://github.com/pomelo-la/pomelo_ex/blob/main/LICENSE)

An Elixir client library for the [Pomelo API](https://developers.pomelo.la) — the Latin American fintech platform for card issuing, digital accounts, KYC/KYB, fraud prevention, loyalty, and credit products.

## Installation

Add `pomelo_ex` to your `mix.exs`:

```elixir
def deps do
  [
    {:pomelo_ex, "~> 0.1.0"}
  ]
end
```

## Configuration

Configure your Pomelo credentials in `config/config.exs`:

```elixir
config :pomelo_ex,
  client_id: "your_client_id",
  client_secret: "your_client_secret",
  url: "https://api.pomelo.la",
  audience: "https://api.pomelo.la",
  grant_type: "client_credentials",
  http_adapter: HTTPoison,
  idempotency_key_length: 32
```

For development, use the sandbox environment:

```elixir
config :pomelo_ex,
  url: "https://sandbox.api.pomelo.la"
```

## Quick Start

```elixir
# 1. Obtain an access token
{:ok, %HTTPoison.Response{body: body}} =
  PomeloEx.General.Authorization.request_token()

token = body["access_token"]

# 2. Create a company
payload = %PomeloEx.Types.General.Companies.CreateCompanyType{
  token: token,
  legal_name: "My Company",
  email: "contact@company.com",
  operation_country: "ARG"
}

{:ok, response} = PomeloEx.General.Company.create_company(payload)

# 3. Create a user
user_payload = %PomeloEx.Types.General.Users.CreateUserType{
  token: token,
  email: "user@company.com",
  operation_country: "ARG"
}

{:ok, response} = PomeloEx.General.Users.create_user(user_payload)
```

## API Domains

| Module | Description |
|--------|-------------|
| `PomeloEx.General.Authorization` | OAuth 2.0 token management |
| `PomeloEx.General.Company` | Company CRUD operations |
| `PomeloEx.General.Users` | User CRUD and custom field mappings |
| `PomeloEx.Identity.KYC` | Know Your Customer verification sessions |
| `PomeloEx.Identity.KYB` | Know Your Business verification sessions |
| `PomeloEx.Cards.Issuing` | Card creation, activation, shipping, and lifecycle |
| `PomeloEx.Cards.Processing` | Transaction authorization, presentment, and reversals |
| `PomeloEx.Cards.Tokenization` | Digital wallet tokenization (Apple Pay, Google Pay, VAU, Click to Pay) |
| `PomeloEx.Cards.SensitiveInformation` | Sensitive card data display and user token management |
| `PomeloEx.Cards.Credits` | Credit products, lines, allocations, statements, and debt management |
| `PomeloEx.Cards.Associations` | Card-to-credit-line associations |
| `PomeloEx.DigitalAccounts` | Digital account creation, balance updates, and P2P transactions |
| `PomeloEx.Finance.Settlements` | Settlement queries and deposit notifications |
| `PomeloEx.Fraud` | Chargebacks, transactional/soft blocks, and travel notices |
| `PomeloEx.FraudPrevention` | Legacy fraud prevention operations |
| `PomeloEx.Loyalty` | Loyalty points and cashback management |

## Documentation

Full API reference is available at [https://hexdocs.pm/pomelo_ex](https://hexdocs.pm/pomelo_ex).

Pomelo API reference: [https://developers.pomelo.la](https://developers.pomelo.la)

## Development

```bash
# Fetch dependencies
mix deps.get

# Run tests
mix test

# Run linter
mix credo

# Generate docs
mix docs
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
