defmodule PomeloEx.Cards.Tokenization.ClickToPay do
  @moduledoc """
  Click to Pay (VISA)
  """
  alias PomeloEx.Cards.Tokenization.ClickToPay.GetStatus
  alias PomeloEx.Cards.Tokenization.ClickToPay.OptIn
  alias PomeloEx.Cards.Tokenization.ClickToPay.OptOut

  @doc """
  Opt-in (Enroll card in Click to Pay)
  """
  defdelegate opt_in(payload), to: OptIn, as: :execute

  @doc """
  Opt-out (Remove card from Click to Pay)
  """
  defdelegate opt_out(payload), to: OptOut, as: :execute

  @doc """
  Get Click to Pay Status
  """
  defdelegate get_status(payload), to: GetStatus, as: :execute
end
