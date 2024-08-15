defmodule PomeloEx.DigitalAccounts.DigitalMovementsAndP2P do
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeDigitalMovements
  alias PomeloEx.DigitalAccounts.DigitalMovementsAndP2P.AuthorizeP2PTransaction

  defdelegate authorize_digital_movements(payload), to: AuthorizeDigitalMovements, as: :execute

  defdelegate authorize_P2P_transaction(payload), to: AuthorizeP2PTransaction, as: :execute
end
