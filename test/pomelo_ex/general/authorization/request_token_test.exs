defmodule PomeloEx.General.Authorization.RequestTokenTest do
  use ExUnit.Case
  doctest PomeloEx.General.Authorization.RequestToken
  alias PomeloEx.General.Authorization.RequestToken

  test "Sucess 200 - Authenticate Token" do
    assert PomeloEx.General.Authorization.RequestToken.execute() == true
  end
end
