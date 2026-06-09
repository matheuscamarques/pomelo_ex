defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P do
  @moduledoc """
  Digital money movements and P2P transactions.

  Provides endpoints for authorizing incoming/outgoing digital money movements,
  peer-to-peer (P2P) transfers between Pomelo accounts, and balance adjustments.
  """
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovements
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransaction
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.UpdateAccountBalance

  @doc """
  Authorize Digital Movements
  The endpoint /core/transactions/v1 allows you to authorize incoming and outgoing money transactions from digital accounts. Check the field result to see the result.
  """
  defdelegate authorize_digital_movements(payload), to: AuthorizeDigitalMovements, as: :execute

  @doc """
  Autorizar Transacción P2P
  El endpoint /core/transactions/v1/p2p te permite autorizar movimientos de terceros (P2P) de entrada y salida de dinero entre dos cuentas de Pomelo. Podrás consultar el resultado de la transacción en el campo result.
  """
  defdelegate authorize_P2P_transaction(payload), to: AuthorizeP2PTransaction, as: :execute

  @doc """
  Update account balance
  The endpoint /core/accounts/v1/{accountId}/balance allows you to adjust an account's balance. It calculates whether it will be a credit or debit operation, creates an associated transaction, and updates the corresponding balance.
  """
  defdelegate update_account_balance(payload), to: UpdateAccountBalance, as: :execute
end
