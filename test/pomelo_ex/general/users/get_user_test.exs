defmodule PomeloEx.General.Users.GetUserTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.GetUser
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - Get User" do
    payload = UsersFixtures.get_user_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/#{payload.id}"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: UsersFixtures.get_user_response()
       }}
    end)

    {:ok, response} = GetUser.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["id"] == payload.id
  end
end
