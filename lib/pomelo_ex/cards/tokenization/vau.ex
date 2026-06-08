defmodule PomeloEx.Cards.Tokenization.VAU do
  @moduledoc """
  VAU (Visa Account Updater)
  """
  alias PomeloEx.Cards.Tokenization.VAU.DisableVauForACard
  alias PomeloEx.Cards.Tokenization.VAU.EnableVauForACard
  alias PomeloEx.Cards.Tokenization.VAU.NotifyAccountClosure
  alias PomeloEx.Cards.Tokenization.VAU.NotifyCardholderContact

  @doc """
  Enable VAU for a card
  """
  defdelegate enable_vau_for_a_card(payload), to: EnableVauForACard, as: :execute

  @doc """
  Disable VAU for a card
  """
  defdelegate disable_vau_for_a_card(payload), to: DisableVauForACard, as: :execute

  @doc """
  Notify contact with the cardholder
  """
  defdelegate notify_cardholder_contact(payload), to: NotifyCardholderContact, as: :execute

  @doc """
  Notify account closure
  """
  defdelegate notify_account_closure(payload), to: NotifyAccountClosure, as: :execute
end
