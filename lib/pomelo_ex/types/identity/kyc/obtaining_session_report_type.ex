defmodule PomeloEx.Types.Identity.KYC.ObtainingSessionReportType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:session_id, :string, enforce: true, null: false)
  end
end
