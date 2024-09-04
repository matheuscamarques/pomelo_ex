defmodule PomeloEx.General.Users.ModifyUserTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.ModifyUser
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - Modify User" do
    payload = UsersFixtures.modify_user_request()

    expect(HTTPMock, :patch, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: UsersFixtures.modify_user_response()
       }}
    end)

    {:ok, response} = ModifyUser.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
    assert body["data"]["status"] == payload.status
  end
end
