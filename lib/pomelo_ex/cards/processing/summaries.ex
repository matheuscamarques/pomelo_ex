defmodule PomeloEx.Cards.Processing.Summaries do
  @moduledoc """
  The Statements API is only available for credit cards issued in Argentina and for those who have not implemented the Credits solution, which means they have not contracted the lending engine
  """

  @doc """
  Calculate Taxes
  The endpoint /taxes/v1/statements is used to initiate the tax calculation for a billing period.

  Considerations
  Please specify the card's public ID and the period for which taxes will be calculated
  """
  alias PomeloEx.Cards.Processing.Summaries.CalculateTaxes
  defdelegate calculate_taxes(payload), to: CalculateTaxes, as: :execute

  @doc """
  Retrieve taxes
  The endpoint /taxes/v1/statements/{statement_id} is used to retrieve the taxes applied to a card during a specific billing period.

  Considerations#
  Please provide the statement_id corresponding to the billing period for which you wish to obtain the applied taxes.
  """
  alias PomeloEx.Cards.Processing.Summaries.RetrieveTaxes
  defdelegate retrieve_taxes(payload), to: RetrieveTaxes, as: :execute
end
