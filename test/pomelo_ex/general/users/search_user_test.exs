defmodule PomeloEx.General.Users.SearchUserTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.SearchUser
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - Search User" do
    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/?"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: UsersFixtures.search_user_response()
       }}
    end)

    payload = UsersFixtures.search_user_request()

    {:ok, response} = SearchUser.execute(payload)

    body = Jason.decode!(response.body)

    user_id =
      body
      |> Map.fetch!("data")
      |> List.first()
      |> Map.fetch!("id")

    assert user_id == "usr-2lWyhVOQarR8I5te2XNXdMleSEu"
  end
end
