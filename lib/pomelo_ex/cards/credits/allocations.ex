defmodule PomeloEx.Cards.Credits.Allocations do
  @moduledoc """
  This service enables you to report user payments and the associated benefits or charges over a credit line. Find more information about allocations in our [documentation](https://docs.pomelo.la/docs/cards/lending/payments).
  """

  @doc """
  Generate allocation
  The endpoint /lending/v1/collections allows you to report the payment made by one of your users, as well as any bonuses or surcharges you need to apply to their credit line.
  """
  alias PomeloEx.Cards.Credits.Allocations.GenerateAllocation
  defdelegate generate_allocation(payload), to: GenerateAllocation, as: :execute

  @doc """
  Obtain allocations
  The /lending/v1/collections endpoint will return all the transactions you have reported that meet the search criteria you set in the parameters.
  """
  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocations
  defdelegate obtain_allocations(payload), to: ObtainAllocations, as: :execute

  @doc """
  Cancel allocation
  The endpoint /lending/v1/collections/{id}/cancel allows you to cancel an allocation that you have already reported to us by simply specifying its ID.
  """
  alias PomeloEx.Cards.Credits.Allocations.CancelAllocation
  defdelegate cancel_allocation(payload), to: CancelAllocation, as: :execute

  @doc """
  Obtain allocation by ID
  The endpoint /lending/v1/collections/{id} allows you to inquire about a specific allocation by providing the ID assigned to it when generated.
  """
  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocation
  defdelegate obtain_allocation(payload), to: ObtainAllocation, as: :execute
end
