defmodule PomeloEx.General.Users.SetCustomFieldMappingsTest do
  use ExUnit.Case
  import Mox

  alias PomeloEx.General.Users.SetCustomFieldMappings
  alias PomeloEx.General.UsersFixtures

  test "Success 200 - Set Custom Field Mappings" do
    payload = UsersFixtures.set_custom_field_mappings_request()

    expect(PomeloEx.Adapter.Mock, :request, fn :post, url, _body, _headers ->
      assert url == Application.get_env(:pomelo_ex, :url) <> "/users/v1/custom-fields/mappings"

      {:ok,
       %PomeloEx.Adapter.Response{
         status: 200,
         body: UsersFixtures.set_custom_field_mappings_response()
       }}
    end)

    {:ok, response} = SetCustomFieldMappings.execute(payload)

    body = Jason.decode!(response.body)
    assert is_list(body["data"])
    assert Enum.at(body["data"], 0)["key"] == "branch"
  end
end
