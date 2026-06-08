defmodule PomeloEx.Cards.Processing.Transactions.CardShippingOfOtpCodes do
  @moduledoc false

  alias PomeloEx.Types.Cards.Processing.Transactions.CardShippingOfOtpCodesType

  def execute(%CardShippingOfOtpCodesType{} = payload) do
    {:ok, payload}
  end
end
