defmodule PomeloEx.General.Authorization.RevokeTokenTest do
  @moduledoc false
  use ExUnit.Case
  alias PomeloEx.General.Authorization.RequestToken
  alias PomeloEx.General.Authorization.RevokeToken

  test "Success 200 - Revoke Token" do
    RequestToken.execute()

    assert {:ok, %HTTPoison.Response{status_code: 200}} = RevokeToken.execute()
  end
end
