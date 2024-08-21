defmodule PomeloEx.General.Authorization.RequestTokenTest do
  @moduledoc false
  use ExUnit.Case
  alias PomeloEx.General.Authorization.RequestToken

  test "Success 200 - Authenticate Token" do
    assert {:ok, %HTTPoison.Response{status_code: 200}} = RequestToken.execute()
  end
end
