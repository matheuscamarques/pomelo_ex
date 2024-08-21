defmodule PomeloEx.Cards.Associations.Associations do
  @moduledoc false
  alias PomeloEx.Cards.Associations.Associations.LinkCard
  alias PomeloEx.Cards.Associations.Associations.SearchAssociations
  alias PomeloEx.Cards.Associations.Associations.UnlinkCard

  @doc """
  Link card
  The endpoint Post /cards/associations/v1 enables you to link a card with a Pomelo user account. Multiple cards can be linked with the same account. For example, it is possible to link a virtual card and a physical card.

  Considerations
  The account and the card to be linked must have an “Active” status.
  The account and the card to be linked must belong to the same user.
  A card can only be linked to one account in each currency. In case you need to link the card with another account with the same currency, you must first delete the existing link before creating a new one.
  """
  defdelegate link_card(payload), to: LinkCard, as: :execute

  @doc """
  Unlink card
  The Delete /cards/associations/v1 endpoint enables you to unlink a card from an account.

  Considerations#
  The account and card must have been previously linked.
  """
  defdelegate unlink_card(payload), to: UnlinkCard, as: :execute

  @doc """
  Search associations
  The Get /cards/associations/v1 endpoint allows you to search for a group of associations.

  Considerations#
  Filters must be specified as parameters following this pattern: filter[campo]=valor. For example: /cards/associations/v1?filter[card_id]=crd-20I5vMjljS3VEyafcX8lA3T3g0c

  Filtering by at least one of the allowed fields is required

  The results will be paginated and you can specify which page to view using: page[number]=value.
  """
  defdelegate search_associations(payload), to: SearchAssociations, as: :execute
end
