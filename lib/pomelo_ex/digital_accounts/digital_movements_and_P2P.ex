defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P do
  @doc """
  Authorize Digital Movements
  The endpoint /core/transactions/v1 allows you to authorize incoming and outgoing money transactions from digital accounts. Check the field result to see the result.
  """
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovements
  defdelegate authorize_digital_movements(payload), to: AuthorizeDigitalMovements, as: :execute

  @doc """
  Autorizar Transacción P2P
  El endpoint /core/transactions/v1/p2p te permite autorizar movimientos de terceros (P2P) de entrada y salida de dinero entre dos cuentas de Pomelo. Podrás consultar el resultado de la transacción en el campo result.
  """
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransaction
  defdelegate authorize_P2P_transaction(payload), to: AuthorizeP2PTransaction, as: :execute
end
