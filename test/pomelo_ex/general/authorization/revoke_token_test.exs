defmodule PomeloEx.General.Authorization.RevokeTokenTest do
  @moduledoc false
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Authorization.RequestToken
  alias PomeloEx.General.Authorization.RevokeToken

  test "Success 200 - Revoke Token" do
    expect(PomeloEx.Adapter.Mock, :request, fn :post, _url, _body, _headers ->
      {:ok, %PomeloEx.Adapter.Response{status: 200, body: "{\"access_token\": \"test\"}"}}
    end)

    RequestToken.execute()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, _url, _body, _headers ->
      {:ok, %PomeloEx.Adapter.Response{status: 200, body: "{}"}}
    end)

    assert {:ok, %PomeloEx.Adapter.Response{status: 200}} = RevokeToken.execute()
  end
end
