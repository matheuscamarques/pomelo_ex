defmodule PomeloEx.DigitalAccounts.AccountsFixtures do
  alias PomeloEx.Types.DigitalAccounts.Accounts.CreateAccountType
  alias PomeloEx.Types.DigitalAccounts.Accounts.DeleteAccountType
  alias PomeloEx.Types.DigitalAccounts.Accounts.UpdateAccountStatusType

  def create_account_request do
    %CreateAccountType{
      token: "fRwX12Dg3345AD",
      owner_type: "USER",
      user_id: "usr-20I2tIqG3buTsvHKKORrtY2MkFH",
      company_id: "cmp-MdUfg48A2H2rvoX7CV3toE0Z72fX",
      country: "ARG",
      currency: "ARS",
      metadata: %{"extra_property_1" => "My value"}
    }
  end

  def create_account_response do
    ~s|
      {
        "data": {
          "id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
          "country": "ARG",
          "data": {
            "license_owner": "CLIENT"
          },
          "currency": "ARS",
          "metadata": {
            "extra_property_1": "My value"
          },
          "status": "ACTIVE",
          "owner_type": "USER",
          "owner_data": {
            "client_id": "cli-20I3zwp4JSAZaHWD8s3xqq5eYub",
            "user_id": "usr-20I2tIqG3buTsvHKKORrtY2MkFH",
            "company_id": "cmp-20I2tIqG3buTsvHKKORrtY2MkFH"
          },
          "created_at": "2024-01-01T00:00:00Z"
        }
      }
    |
  end

  def delete_account_request do
    %DeleteAccountType{
      token: "fRwX12Dg3345AD",
      id: "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
      status_update_motive: "OTHER",
      status_update_comment: "Motivo de actualización del estado de la cuenta."
    }
  end

  def delete_account_response do
    ~s|
      {
        "data": {
          "id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
          "country": "ARG",
          "data": {
            "license_owner": "CLIENT"
          },
          "currency": "ARS",
          "metadata": {
            "extra_property_1": "My value"
          },
          "status": "DELETED",
          "owner_type": "USER",
          "owner_data": {
            "client_id": "cli-20I3zwp4JSAZaHWD8s3xqq5eYub",
            "user_id": "usr-20I2tIqG3buTsvHKKORrtY2MkFH",
            "company_id": "cmp-20I2tIqG3buTsvHKKORrtY2MkFH"
          },
          "created_at": "2024-01-01T00:00:00Z",
          "updated_at": "2024-01-01T00:00:00Z",
          "status_update_motive": "OTHER",
          "status_update_comment": "Motivo de actualizacion del estado de la cuenta. Solo será devuelto cuando el motivo de actualización de la cuenta sea OTHER."
        }
      }
    |
  end

  def update_account_status_request do
    %UpdateAccountStatusType{
      token: "fRwX12Dg3345AD",
      id: "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
      status: "ACTIVE",
      status_update_motive: "OTHER",
      status_update_comment: "Motivo de actualización del estado de la cuenta."
    }
  end

  def update_account_status_response do
    ~s|
      {
        "data": {
          "id": "acc-20I5vMjljS3VEyafcX8lA3T3g0c",
          "country": "ARG",
          "data": {
            "license_owner": "CLIENT"
          },
          "currency": "ARS",
          "metadata": {
            "extra_property_1": "My value"
          },
          "status": "ACTIVE",
          "owner_type": "USER",
          "owner_data": {
            "client_id": "cli-20I3zwp4JSAZaHWD8s3xqq5eYub",
            "user_id": "usr-20I2tIqG3buTsvHKKORrtY2MkFH",
            "company_id": "cmp-20I2tIqG3buTsvHKKORrtY2MkFH"
          },
          "created_at": "2024-01-01T00:00:00Z",
          "updated_at": "2024-01-01T00:00:00Z",
          "status_update_motive": "OTHER",
          "status_update_comment": "Motivo de actualización del estado de la cuenta. Solo será devuelto cuando el motivo de actualización de la cuenta sea OTHER."
        }
      }
    |
  end
end
