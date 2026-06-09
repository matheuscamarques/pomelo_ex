defmodule PomeloEx.Cards.Tokenization do
  @moduledoc """
  Digital card token lifecycle management.

  Manages the lifecycle of digital tokens used for contactless payments via digital wallets
  (Apple Pay, Google Pay), VAU (Visa Acceptance Update), and Click to Pay.

  ## Sub-modules

  - `PomeloEx.Cards.Tokenization.Mastercard` — Mastercard digital wallet provisioning
  - `PomeloEx.Cards.Tokenization.Visa` — Visa digital wallet provisioning
  - `PomeloEx.Cards.Tokenization.VAU` — Visa Acceptance Update (VAU) management
  - `PomeloEx.Cards.Tokenization.ClickToPay` — Click to Pay opt-in/out
  - `PomeloEx.Cards.Tokenization.Standalone` — Standalone token management
  - `PomeloEx.Cards.Tokenization.Webhooks` — Token event notifications

  ## Token lifecycle

  - `get_token_by_id/1` — Retrieve token details
  - `suspend_token/1` — Temporarily disable a token
  - `unsuspend_token/1` — Re-enable a suspended token
  - `delete_token/1` — Permanently remove a token
  """
  alias PomeloEx.Cards.Tokenization.DeleteToken
  alias PomeloEx.Cards.Tokenization.GetTokenById
  alias PomeloEx.Cards.Tokenization.GetTokensByCardId
  alias PomeloEx.Cards.Tokenization.SuspendToken
  alias PomeloEx.Cards.Tokenization.UnsuspendToken

  @doc """
  Get Token by ID
  """
  defdelegate get_token_by_id(payload), to: GetTokenById, as: :execute

  @doc """
  Suspend Token
  """
  defdelegate suspend_token(payload), to: SuspendToken, as: :execute

  @doc """
  Unsuspend Token
  """
  defdelegate unsuspend_token(payload), to: UnsuspendToken, as: :execute

  @doc """
  Delete Token
  """
  defdelegate delete_token(payload), to: DeleteToken, as: :execute

  @doc """
  Get Tokens by Card ID
  """
  defdelegate get_tokens_by_card_id(payload), to: GetTokensByCardId, as: :execute
end
