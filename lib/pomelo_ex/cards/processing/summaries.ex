defmodule PomeloEx.Cards.Processing.Summaries do
  @moduledoc """
  The Statements API is only available for credit cards issued in Argentina and for those who have not implemented the Credits solution, which means they have not contracted the lending engine
  """

  alias PomeloEx.Cards.Processing.Summaries.CalculateTaxes
  alias PomeloEx.Cards.Processing.Summaries.RetrieveTaxes

  defdelegate calculate_taxes(payload), to: CalculateTaxes, as: :execute
  defdelegate retrieve_taxes(payload), to: RetrieveTaxes, as: :execute
end
