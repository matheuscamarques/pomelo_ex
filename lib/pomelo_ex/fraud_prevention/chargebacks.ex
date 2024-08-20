defmodule PomeloEx.FraudPrevention.Chargebacks do
  @moduledoc """
  The Pomelo Chargeback Service is a comprehensive solution designed to facilitate and optimize the chargeback management of payment transactions made through the Pomelo platform.

  What is a chargeback?#
  A chargeback is a refund request for a payment made through the Pomelo platform.

  Chargebacks status#
  All chargebacks have a status field describing which state of the management process they are in. The possible chargeback statuses are the following:

    - PENDING: The chargeback is in pending status.
    - UNDER_EVALUATION: A first analysis of the chargeback is underway, and more information is needed to continue with the dispute.
    - DISPUTE_OPEN: The transaction dispute was opened with the brand (Mastercard or Visa) and we are waiting for their response.
    - DISPUTE_REJECTED: The dispute was rejected by the brand since the transaction did not meet the requirements to be disputed.
    - DISPUTE_WON: The dispute was won in favor of the issuer.
    - DISPUTE_LOST: The dispute was lost; in this case, the liability remains on the issuer's or cardholder's side.
    - DISPUTE_NOT_PROCESSED: No pudimos procesar el contracargo dadas las características del pago.
    - TRANSACTION_NOT_PRESENTED: La transacción aún no ha sido presentada por el adquirente, por lo que no es posible solicitar un contracargo.
  """

  @doc """
  Create chargeback
  The endpoint /chargebacks/v2/ permits the creation of a chargeback.

  Validations
  To create a chargeback, the following validations must be fulfilled:

    - Only one chargeback can exist for each transaction.
    - The amount input must be greater than 0.
    - The amount input must be less than or equal to the transaction amount.
    - The transaction associated with the chargeback must have occurred less than 90 days ago.
  Considerations
  When creating a chargeback of type CONTROVERSY, we can add attachments to support the dispute. For this, use the resource /chargebacks/v2/{chargebackId}/attachments
  """
  alias PomeloEx.FraudPrevention.Chargebacks.CreateChargeback
  defdelegate create_chargeback(payload), to: CreateChargeback, as: :execute

  @doc """
  Attach file to a chargeback
  The endpoint /chargebacks/v2/$ID/attachments enables the attachment of files to a chargeback in order to send it to the brand and simplify the dispute resolution

  Restrictions
    - The attached file must be an image or a PDF file.
    - The attached file must be smaller than 3 MB.
    - Each chargeback may have up to 3 files attached.
  How to attach the file?
  The file must be attached in the request body as a multipart/form-data, under the fileUpload key.
  """
  alias PomeloEx.FraudPrevention.Chargebacks.AttachFileToChargeback
  defdelegate attach_file_to_chargeback(payload), to: AttachFileToChargeback, as: :execute

  @doc """
  Find chargebacks
  The endpoint /chargebacks/v2/ performs a search for customer chargebacks. Filters can be added to tailor the search results.

  Considerations
  Filters must be specified as parameters following this pattern: filter[field]=value. For example: filter[status]=APPROVED

  The results will be paginated and you can specify the amount of data per page and also which page you wish to view.

  Date range
  There is a filter for the field created_at, which you can use to get the chargebacks created within a date range. For example: filter[created_at][from]=2022-07-27&filter[created_at][to]=2022-07-28

  You can also filter by the last update date using updated_at.

  Sorting
  You can specify the order of the results with certain parameters that you must send as list of strings in the sort filter type. For example: ?sort=status,created_at

  The default sorting will be ascending. To specify a descending sorting, you must send the character '-' as a prefix of the attribute. For example: ?sort=status,-created_at
  """
  alias PomeloEx.FraudPrevention.Chargebacks.FindChargebacks
  defdelegate find_chargebacks(payload), to: FindChargebacks, as: :execute

  @doc """
  Obtain chargeback
  Returns a chargeback with the Identifier given by parameter
  """
  alias PomeloEx.FraudPrevention.Chargebacks.ObtainChargeback
  defdelegate obtain_chargeback(payload), to: ObtainChargeback, as: :execute
end
