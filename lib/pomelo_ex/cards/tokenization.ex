defmodule PomeloEx.Cards.Tokenization do
  @moduledoc """
  Tokenization
  Use these endpoints to manage the lifecycle of your digital tokens.
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
