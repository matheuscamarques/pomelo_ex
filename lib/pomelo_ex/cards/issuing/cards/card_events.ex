defmodule PomeloEx.Cards.Issuing.Cards.CardEvents do
  @moduledoc false

  alias PomeloEx.Types.Cards.Issuing.CardEventsType

  def execute(%CardEventsType{} = payload) do
    {:ok, payload}
  end
end
