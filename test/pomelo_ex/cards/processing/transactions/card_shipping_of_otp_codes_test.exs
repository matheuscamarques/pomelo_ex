defmodule PomeloEx.Cards.Processing.Transactions.CardShippingOfOtpCodesTest do
  use ExUnit.Case

  alias PomeloEx.Cards.Processing.Transactions.CardShippingOfOtpCodes
  alias PomeloEx.Cards.ProcessingTransactionsFixtures

  test "Success - Card Shipping of OTP Codes" do
    payload = ProcessingTransactionsFixtures.card_shipping_of_otp_codes_request()

    assert {:ok, response} = CardShippingOfOtpCodes.execute(payload)
    assert response == payload
  end
end
