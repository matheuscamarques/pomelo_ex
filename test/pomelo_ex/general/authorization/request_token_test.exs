defmodule PomeloEx.General.Authorization.RequestTokenTest do
  @moduledoc false
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Authorization.RequestToken

  test "Success 200 - Authenticate Token" do
    expect(PomeloEx.Adapter.Mock, :request, fn :post, _url, _body, _headers ->
      {:ok, %PomeloEx.Adapter.Response{status: 200, body: "{\"access_token\": \"test\"}"}}
    end)

    assert {:ok, %PomeloEx.Adapter.Response{status: 200}} = RequestToken.execute()
  end
end
