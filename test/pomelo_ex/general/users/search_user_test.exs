defmodule PomeloEx.General.Users.SearchUserTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.SearchUser
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - Search User" do
    expect(HTTPMock, :post, fn url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: UsersFixtures.search_user_response()
       }}

      {:ok, response} = SearchUser.execute(%SearchUser{})

      body = Jason.decode!(response.body)
      assert body["data"]["id"] == "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
    end)
  end
end
