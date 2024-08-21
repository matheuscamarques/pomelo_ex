defmodule PomeloEx.Cards.Associations.AssociateCredit do
  @moduledoc """
  This service allows you to associate a line of credit with a specific credit card.
  """
  alias PomeloEx.Cards.Associations.AssociateCredit.AssociateCardWithLineOfCredit
  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociations
  alias PomeloEx.Cards.Associations.AssociateCredit.GetAssociationsByCreditLine

  @doc """
  Associate Card with Line of Credit
  To associate a card you must activate it previously (see [Activate Card](https://developers.pomelo.la/en/api-reference/cards/issuing/cards#activate-card)). This does not apply to virtual cards, which are active from the moment of creation. For a successful association, the Line of Credit offer must be eligible..
  """
  defdelegate associate_card_with_line_of_credit(payload),
    to: AssociateCardWithLineOfCredit,
    as: :execute

  @doc """
  Get associations between Cards and Credit Lines
  You will be able to check the associations by credit_line_id
  """
  defdelegate get_association_by_credit_line(payload),
    to: GetAssociationsByCreditLine,
    as: :execute

  @doc """
  Obtain associations between Cards and Credit Lines given an association id
  You will be able to check the associations by association id
  """
  defdelegate get_associations(payload), to: GetAssociations, as: :execute
end
