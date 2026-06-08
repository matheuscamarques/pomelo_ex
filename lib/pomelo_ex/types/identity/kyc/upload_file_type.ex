defmodule PomeloEx.Types.Identity.KYC.UploadFileType do
  @moduledoc false
  use TypedEctoSchema

  @primary_key false
  typed_embedded_schema do
    field(:token, :string, enforce: true, null: false)
    field(:session_id, :string, enforce: true, null: false)
    field(:user_id, :string, enforce: true, null: false)
    field(:type_document, :string, enforce: true, null: false)
    field(:file_path, :string, enforce: true, null: false)
  end
end
