defmodule PomeloEx.FraudPrevention.Chargebacks do
  @doc """
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

  alias PomeloEx.FraudPrevention.Chargebacks.AttachFileToChargeback
  alias PomeloEx.FraudPrevention.Chargebacks.CreateChargeback
  alias PomeloEx.FraudPrevention.Chargebacks.FindChargebacks
  alias PomeloEx.FraudPrevention.Chargebacks.ObtainChargeback

  defdelegate attach_file_to_chargeback(payload), to: AttachFileToChargeback, as: :execute
  defdelegate create_chargeback(payload), to: CreateChargeback, as: :execute
  defdelegate find_chargebacks(payload), to: FindChargebacks, as: :execute
  defdelegate obtain_chargeback(payload), to: ObtainChargeback, as: :execute
end
