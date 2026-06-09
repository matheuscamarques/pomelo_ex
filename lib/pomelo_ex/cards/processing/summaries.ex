defmodule PomeloEx.Cards.Processing.Summaries do
  @moduledoc """
  Tax calculation and retrieval for card statements.

  Available for credit cards issued in Argentina that do not use the Pomelo Credits
  lending engine. Provides tax calculation initiation and retrieval of applied taxes
  per billing period.
  """
  alias PomeloEx.Cards.Processing.Summaries.CalculateTaxes
  alias PomeloEx.Cards.Processing.Summaries.RetrieveTaxes

  @doc """
  Calculate Taxes
  The endpoint /taxes/v1/statements is used to initiate the tax calculation for a billing period.

  Considerations
  Please specify the card's public ID and the period for which taxes will be calculated
  """
  defdelegate calculate_taxes(payload), to: CalculateTaxes, as: :execute

  @doc """
  Retrieve taxes
  The endpoint /taxes/v1/statements/{statement_id} is used to retrieve the taxes applied to a card during a specific billing period.

  Considerations#
  Please provide the statement_id corresponding to the billing period for which you wish to obtain the applied taxes.
  """
  defdelegate retrieve_taxes(payload), to: RetrieveTaxes, as: :execute
end
