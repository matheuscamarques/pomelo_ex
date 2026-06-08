defmodule PomeloEx.Cards.Processing.OnUs do
  @moduledoc """
  On-us transaction processing allows you to process transactions without card network/flag involvement.

  See [documentation](https://developers.pomelo.la/api-reference/processing/on-us) to know the flow.
  """

  alias PomeloEx.Cards.Processing.OnUs.Authorize
  alias PomeloEx.Cards.Processing.OnUs.PresentTransactionByExternalId
  alias PomeloEx.Cards.Processing.OnUs.PresentTransactionByPomeloId
  alias PomeloEx.Cards.Processing.OnUs.ReverseTransaction
  alias PomeloEx.Cards.Processing.OnUs.ReverseTransactionByExternalId

  @doc """
  Authorize transaction.
  """
  defdelegate authorize(payload), to: Authorize, as: :execute

  @doc """
  Reverse a transaction by its original transaction ID.
  """
  defdelegate reverse_transaction(payload), to: ReverseTransaction, as: :execute

  @doc """
  Reverse a transaction by its external ID.
  """
  defdelegate reverse_transaction_by_external_id(payload),
    to: ReverseTransactionByExternalId,
    as: :execute

  @doc """
  Present a transaction by its external ID.
  """
  defdelegate present_transaction_by_external_id(payload),
    to: PresentTransactionByExternalId,
    as: :execute

  @doc """
  Reverse a presentment by its Pomelo ID (original_presentment_id).
  """
  defdelegate present_transaction_by_pomelo_id(payload),
    to: PresentTransactionByPomeloId,
    as: :execute
end
