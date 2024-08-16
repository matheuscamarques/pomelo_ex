defmodule PomeloEx.Cards.Issuing.Shipments do
  @moduledoc """
  The Shipping API comprises all the endpoints for creating shipments and retrieving data for your created shipments. You will also find endpoints to receive notifications about updates on the status of your shipments via a webhook.

  External shipments
  When defining your integration, you will have the option to NOT use our card distribution service.

  In that case, the affinity groups will reflect the settings you have chosen. Also, when creating a card or a batch of cards, we will return an identifier in the shipment_id field, which we recommend you store in your integration, since you will need it for pick-up. The cards will be available for pick-up at the embossing facility specified in integration.
  """

  @doc """
  Create Shipment
  The /shipping/v1/ endpoint is used to create a new shipment for an unnamed card. Please note that in order to create a shipment, it is required that you have [batch of unnamed cards created](https://developers.pomelo.la/en/api-reference/cards/issuing/cards#create-batch-of-innominate-cards).

  Considerations#
  The region field corresponds to:

  Province in Argentina
    - State in Brazil
    - State in Colombia
    - State in Mexico
  The courier.tracking_url field of the response will be available once the shipment is reported by the corresponding logistics partner. Until then, it will have a null value

  For Brazil
  If you operate in Brazil, the taxIdentificationNumber is always mandatory.
  The fields 'documentNumber' and 'documentType' will not be required.
  You must also fill out the region field with the two-character UF code. Example: 'SP' for São Paulo
    - Rondônia (RO)
    - Acre (AC)
    - Amazonas (AM)
    - Roraima (RR)
    - Pará (PA)
    - Amapá (AP)
    - Tocantins (TO)
    - Maranhão (MA)
    - Piauí (PI)
    - Ceará (CE)
    - Rio Grande do Norte (RN)
    - Paraíba (PB)
    - Pernambuco (PE)
    - Alagoas (AL)
    - Sergipe (SE)
    - Bahia (BA)
    - Minas Gerais (MG)
    - Espírito Santo (ES)
    - Rio de Janeiro (RJ)
    - São Paulo (SP)
    - Paraná (PR)
    - Santa Catarina (SC)
    - Rio Grande do Sul (RS)
    - Mato Grosso do Sul (MS)
    - Mato Grosso (MT)
    - Goiás (GO)
    - Distrito Federal (DF)
  For Colombia
  If operating in Colombia, the zip_code field is optional, i.e. you may choose not to submit it.

  Envio de tarjetas innominadas desde deposito
  Puedes asociar un envío con el usuario al que le enviarás la tarjeta especificando el user_id en el body del shipment.
  """
  alias PomeloEx.Cards.Issuing.Shipments.CreateShipment
  defdelegate create_shipment(payload), to: CreateShipment, as: :execute

  @doc """
  Search shipment
  The endpoint /shipping/v1/ enables searching for a group of cards based on the attributes specified.

  You'll know how to apply filters and sort the shipments by following [this documentation](https://developers.pomelo.la/api-reference/filters).

  The possible sorting attributes are:

    - shipment_type
    - status
    - status_detail
    - created_at
  """
  alias PomeloEx.Cards.Issuing.Shipments.SearchShipment
  defdelegate search_shipment(payload), to: SearchShipment, as: :execute

  @doc """
  Change shipping data
  The /shipping/v1/{shipment_id} endpoint allows you to update the delivery address of a shipment.

  Considerations
  To update the delivery address, the shipment must have one of the following values as STATUS_DETAIL depending on the carrier:

  | Courier    | Allowed states                                                                                                                                       |
  |------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
  | 99 MINUTOS | SHIPMENT_CONFIRMED, IN_WAREHOUSE, RECEIVED_BY_CARRIER, ROAD_TO_PICKUP, UNSUCCESSFUL_PICKUP                                                            |
  | ANDREANI   | PENDING, END_OF_CUSTODY, DISTRIBUTION, WRONG_ADDRESS                                                                                                  |
  | DOMINA     | CALL_SCHEDULED, VISIT_SCHEDULED, CALL_FAILED_UNKNOWN, CLIENT_NOT_PRESENT, WRONG_ADDRESS, IN_TRANSIT, INCOMPLETE_ADDRESS, RECEIVED_BY_CARRIER, CALL_RESCHEDULED |
  | ESTAFETA   | FAILED_DELIVERY_ATTEMPT                                                                                                                               |
  | FLASH      | START_OF_CUSTODY                                                                                                                                      |
  You won't be able to create another change of address request for a shipment while one is pending.

  To check the status of the request, you will need to interact with the endpoint Get shipment. In the request_status field, you will see one of the following values:

    - PENDING_UPDATE_ADDRESS: waiting for the carrier's response.
    - CONFIRMED_UPDATE_ADDRESS: the carrier has confirmed the shipment's address change.
    - REJECTED_UPDATE_ADDRESS: the carrier has rejected the shipment's address change.
  If your request is rejected, you will continue to see the original shipping address.
  """
  alias PomeloEx.Cards.Issuing.Shipments.ChangeShipmentData
  defdelegate change_shipment_data(payload), to: ChangeShipmentData, as: :execute

  @doc """
  Get Shipping
  The /shipping/v1/{shipment_id} endpoint allows you to get information about a particular shipment.

  Do you have any doubts regarding the shipment statuses? We explain the meaning of each one in [our documentation](https://docs.pomelo.la/docs/cards/issuing/delivery).

  Considerations
  You will need to specify the shipment_id to perform the query.

  Shipments to a warehouse and in Mexican territory:
  For shipments heading to a warehouse and for those within Mexico, we won't provide an external tracking ID. But no need to fret! We'll keep you updated on the shipment status through the [Dashboard](https://dashboard.pomelo.la/) and also [via webhooks](https://developers.pomelo.la/api-reference/cards/issuing/envios#novedades-de-los-envios).
  """
  alias PomeloEx.Cards.Issuing.Shipments.GetShipment
  defdelegate get_shipment(payload), to: GetShipment, as: :execute

  @doc """
  Get shipment history
  The /shipping/v1/{shipment_id}/history endpoint allows you to get the history of states of a specific shipment.

  Do you have any doubts regarding the shipment statuses? We explain the meaning of each one in [our documentation](https://docs.pomelo.la/docs/cards/issuing/delivery).

  Considerations
  You will need to specify the shipment_id to perform the query.

  The list of events is ordered in ascending order by update date, i. e. the most recent status is at the end of the list.
  """
  alias PomeloEx.Cards.Issuing.Shipments.GetShipmentHistory
  defdelegate get_shipment_history(payload), to: GetShipmentHistory, as: :execute

  @doc """
  Shipments notifications
  You must include this endpoint in your service so that we can provide you with real-time updates on shipments.

  If you have doubts about how to set up a webhook, visit [our documentation](https://docs.pomelo.la/en/docs/developers/webhooks).

  Considerations
    - In the updates, we'll notify you if there are any changes regarding a shipment. Please note that you'll be responsible for [fetching the shipment](https://developers.pomelo.la/en/api-reference/cards/issuing/shipments#obtener-envio) to check the updated status.
    - We expect a response in the 2XX range to ensure that you've received the notification. Otherwise, we'll resend it.
  Find more information about the shipment status in [our documentation](https://docs.pomelo.la/docs/cards/issuing/delivery).
  """
  alias PomeloEx.Cards.Issuing.Shipments.ShipmentNotifications
  defdelegate shipment_notifications(payload), to: ShipmentNotifications, as: :execute

  @doc """
  Request receiver data
  The /shipping/v1/{shipment_id}/receiver endpoint allows you to request the data of the recipient who received the shipment.

  Considerations#
  You won't be able to create a request while there is a pending one for the same shipment_id.

  To check the status of the request, you will need to interact with the endpoint [Get shipment](https://developers.pomelo.la/en/api-reference/cards/issuing/shipments#get-shipping). In the request_status field, you will see one of the following values:

    - REQUESTED_RECEIVER_DATA: Waiting for the carrier to share the recipient's shipping data.
    - GOT_RECEIVER_DATA: The carrier has shared the recipient's shipping data with us.
    - MISSING_RECEIVER_DATA: The carrier could not share the shipment receiver data with us.
  To view the recipient's data of the card, interact again with the endpoint [Get shipment](https://developers.pomelo.la/en/api-reference/cards/issuing/shipments#get-shipping) and read the received_by field located within courier_additional_info.
  """
  alias PomeloEx.Cards.Issuing.Shipments.RequestReceiverData
  defdelegate request_receiver_data(payload), to: RequestReceiverData, as: :execute
end
