defmodule PomeloEx.General.Users.CreateUserTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.CreateUser
  alias PomeloEx.General.UsersFixtures

  test "Success 201 - Create User" do
    payload = UsersFixtures.create_user_request()

    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/"

      {:ok,
       %HTTPoison.Response{
         status_code: 201,
         body: UsersFixtures.create_user_response()
       }}
    end)

    {:ok, response} = CreateUser.execute(payload)

    body = Jason.decode!(response.body)
    assert body["data"]["email"] == payload.email
  end
end
