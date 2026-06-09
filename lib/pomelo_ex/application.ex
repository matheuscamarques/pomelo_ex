defmodule PomeloEx.Application do
  @moduledoc """
  OTP Application module for `PomeloEx`.

  Starts the application supervisor tree. Currently, the library is stateless
  (no GenServers or ETS tables) and the supervisor starts with no children.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = []

    opts = [strategy: :one_for_one, name: PomeloEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
