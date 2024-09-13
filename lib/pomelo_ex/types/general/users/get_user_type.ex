defmodule PomeloEx.Types.General.Users.GetUserType do
  @moduledoc false
  use TypedEctoSchema

  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
  end
end
