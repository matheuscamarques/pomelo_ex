defmodule PomeloEx.General.Users.ListCustomFieldMappingsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.ListCustomFieldMappings
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - List Custom Field Mappings" do
    payload = UsersFixtures.list_custom_field_mappings_request()

    expect(HTTPMock, :get, fn url, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/custom-fields/mappings"

      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: UsersFixtures.list_custom_field_mappings_response()
       }}
    end)

    {:ok, response} = ListCustomFieldMappings.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert Enum.at(body["data"], 0)["key"] == "branch"
  end
end
