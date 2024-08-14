defmodule PomeloEx.Cards.Credits.Allocations do
  @moduledoc """
  This service enables you to report user payments and the associated benefits or charges over a credit line. Find more information about allocations in our [documentation](https://docs.pomelo.la/docs/cards/lending/payments).
  """

  alias PomeloEx.Cards.Credits.Allocations.CancelAllocation
  alias PomeloEx.Cards.Credits.Allocations.GenerateAllocation
  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocation
  alias PomeloEx.Cards.Credits.Allocations.ObtainAllocations

  defdelegate cancel_allocation(payload), to: CancelAllocation, as: :execute
  defdelegate generate_allocation(payload), to: GenerateAllocation, as: :execute
  defdelegate obtain_allocation(payload), to: ObtainAllocation, as: :execute
  defdelegate obtain_allocations(payload), to: ObtainAllocations, as: :execute
end
