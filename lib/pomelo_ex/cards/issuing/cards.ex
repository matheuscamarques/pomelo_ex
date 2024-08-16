defmodule PomeloEx.Cards.Issuing.Cards do
  @moduledoc """
  Cards
  The Cards API contains all the endpoints needed to create nominate and innominate cards, activate them, run queries, retrieve information on a particular card, and more.
  """

  @doc """
  Create Card
  The endpoint /cards/v1/ enables you to create a new physical or virtual card.

  We will validate that you meet the requirements detailed in the [documentation](https://docs.pomelo.la/en/docs/cards/issuing/cards#3-create-cards).
  """
  alias PomeloEx.Cards.Issuing.Cards.CreateCard
  defdelegate create_card(payload), to: CreateCard, as: :execute

  @doc """
  Search Cards
  The endpoint /cards/v1/ enables searching for a group of cards based on the attributes specified.

  You can filter and sort cards by following this [documentation](https://developers.pomelo.la/en/api-reference/filters).

  The possible sorting attributes are:

    - card_type
    - user_id
    - status
    - affinity_group_id
    - status_detail
    - shipment_id
    - innominate
    - start_date.
  """
  alias PomeloEx.Cards.Issuing.Cards.SearchCards
  defdelegate search_cards(payload), to: SearchCards, as: :execute

  @doc """
  Get Card
  The endpoint /cards/v1/{id} enables retrieving information about a particular card.

  Considerations
    - The extend parameter is used to obtain additional data from a card, and to use it, you must have a valid and current PCI-DSS certification, backed by the ROC report. If you do not have the certification, follow the steps in [this documentation](https://docs.pomelo.la/en/docs/cards/issuing/sensitive-information).
    - If you have contracted dynamic CVV, you will see the cvv_expiration_time field that determines the validity of the new code. Learn more about [dynamic CVV](https://docs.pomelo.la/en/docs/cards/issuing/dynamic-cvv).
  """
  alias PomeloEx.Cards.Issuing.Cards.GetCard
  defdelegate get_card(payload), to: GetCard, as: :execute

  @doc """
  Update Card
  The endpoint /cards/v1/{id} enables updating a card’s status, affinity group, and PIN.

  Considerations#
  You will need to specify a reason from the list below in order to update a card status:

  | New status	        | Valid reason            |
  |---------------------|-------------------------|
  | BLOCKED / DISABLED	| CLIENT_INTERNAL_REASON  |
  | BLOCKED / DISABLED	| USER_INTERNAL_REASON    |
  | DISABLED            |	LOST                    |
  | DISABLED            |	STOLEN                  |
  | DISABLED            |	BROKEN                  |
  | DISABLED            |	UPGRADE                 |
  """
  alias PomeloEx.Cards.Issuing.Cards.UpdateCard
  defdelegate update_card(payload), to: UpdateCard, as: :execute

  @doc """
  Activate Card
  The endpoint /cards/v1/activation enables you to activate a physical card and also set up a PIN.

  We will validate that you meet the requirements detailed in the [documentation](https://docs.pomelo.la/en/docs/cards/issuing/cards#4-activate-card).
  """
  alias PomeloEx.Cards.Issuing.Cards.ActivateCard
  defdelegate activate_card(payload), to: ActivateCard, as: :execute

  @doc """
  Card events
  Add this endpoint to your service so that we can communicate the latest news about your cards in real time.

  If you have doubts about how to set up a webhook, visit [our documentation](https://docs.pomelo.la/en/docs/developers/webhooks).

  Considerations#
  We expect a response in the 2XX range to ensure that you've received the notification. Otherwise, we'll resend it.

  Types of Events#
    - ACTIVATION: We will notify you every time one of your customers activates their card.
  """
  alias PomeloEx.Cards.Issuing.Cards.CardEvents
  defdelegate card_events(payload), to: CardEvents, as: :execute

  @doc """
  Update Card Shipping
  The endpoint /cards/v1/{id}/shipment enables updating the shipping address of a card.

  Considerations#
  The card must be physical, nominate and have a CREATED status.
  """
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardShipping
  defdelegate update_card_shipping(payload), to: UpdateCardShipping, as: :execute

  @doc """
  Create Batch of Innominate Cards
  The endpoint /cards/v1/batches enables you to create a batch of innominate cards.

  We will validate that you meet the requirements detailed in the [documentation](https://docs.pomelo.la/en/docs/cards/issuing/cards#3-create-cards).

  Considerations
    - Each batch can contain a maximum of 1,000 cards.
    - The shipping address is mandatory when distribution type is CLIENT.
    - We will process the call asynchronously, i.e. the cards may not be available immediately.
  """
  alias PomeloEx.Cards.Issuing.Cards.CreateBatchInnominateCards
  defdelegate create_batch_innominate_cards(payload), to: CreateBatchInnominateCards, as: :execute

  @doc """
  Create Multiple Batches of Innominates
  The endpoint /cards/v1/batches/bulk allows you to create up to 15 batches of innominate cards at the same time.

  We will validate that you meet the requirements detailed in the [documentation](https://docs.pomelo.la/en/docs/cards/issuing/cards#3-create-cards).

  Considerations#
    - Each batch can contain a maximum of 1,000 cards.
    - The shipping address is mandatory when distribution type is CLIENT.
    - We will process the call asynchronously, i.e. the cards may not be available immediately.
  """
  alias PomeloEx.Cards.Issuing.Cards.CreateMultipleBatchInnominateCards

  defdelegate create_multiple_batch_innominate_cards(payload),
    to: CreateMultipleBatchInnominateCards,
    as: :execute

  @doc """
  Update Card Batch Shipping
  The endpoint /cards/v1/batches/shipments/{shipmentId} enables updating the shipping address of a batch of cards.

  Considerations#
  The card batch must be physical, innominate and have a CREATED status.
  """
  alias PomeloEx.Cards.Issuing.Cards.UpdateCardBatchShipping
  defdelegate update_card_batch_shipping(payload), to: UpdateCardBatchShipping, as: :execute

  @doc """
  Get Affinity Group
  The endpoint '/config/affinity-groups/{id}' allows to obtain information about a particular affinity group.
  """
  alias PomeloEx.Cards.Issuing.Cards.GetAffinityGroup
  defdelegate get_affinity_group(payload), to: GetAffinityGroup, as: :execute
end
