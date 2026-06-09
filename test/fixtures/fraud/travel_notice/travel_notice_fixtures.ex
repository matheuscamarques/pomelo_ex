defmodule PomeloEx.Fraud.TravelNoticeFixtures do
  alias PomeloEx.Types.Fraud.TravelNotice.CreateTravelNoticeType
  alias PomeloEx.Types.Fraud.TravelNotice.GetTravelNoticeType
  alias PomeloEx.Types.Fraud.TravelNotice.UpdateTravelNoticeType

  def create_travel_notice_request do
    %CreateTravelNoticeType{
      token: "fRwX12Dg3345AD",
      body: %{
        "user_id" => "usr-12345",
        "expiration_date" => "2025-03-20T20:57:10Z",
        "value" => %{
          "countries" => ["ARG"]
        }
      }
    }
  end

  def create_travel_notice_response do
    ~s|
      {
        "data": {
          "travel_notice": {
            "countries": ["ARG"]
          },
          "travel_notice_exp_date": "2024-03-09T00:00:00Z"
        }
      }
    |
  end

  def get_travel_notice_request do
    %GetTravelNoticeType{
      token: "fRwX12Dg3345AD",
      user_id: "usr-12345"
    }
  end

  def get_travel_notice_response do
    ~s|
      {
        "data": {
          "travel_notice": {
            "countries": ["ARG"]
          },
          "travel_notice_exp_date": "2024-03-09T00:00:00Z"
        }
      }
    |
  end

  def update_travel_notice_request do
    %UpdateTravelNoticeType{
      token: "fRwX12Dg3345AD",
      body: %{
        "user_id" => "usr-12345",
        "expiration_date" => "2025-04-20T20:57:10Z",
        "value" => %{
          "countries" => ["ARG", "BRA"]
        }
      }
    }
  end

  def update_travel_notice_response do
    ~s|
      {
        "data": {
          "travel_notice": {
            "countries": ["ARG", "BRA"]
          },
          "travel_notice_exp_date": "2025-04-20T20:57:10Z"
        }
      }
    |
  end
end
