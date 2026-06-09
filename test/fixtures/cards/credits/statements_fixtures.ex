defmodule PomeloEx.Cards.Credits.StatementsFixtures do
  alias PomeloEx.Types.Cards.Credits.Statements.GetStatementType
  alias PomeloEx.Types.Cards.Credits.Statements.SearchAccountStatementsType
  alias PomeloEx.Types.Cards.Credits.Statements.GetLastStatementsType
  alias PomeloEx.Types.Cards.Credits.Statements.GetFollowingStatementsType

  def get_statement_request do
    %GetStatementType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
      id: "lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP",
      extended: "pdf_url"
    }
  end

  def get_statement_response do
    ~s|
      {
        "data": {
          "id": "lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP",
          "status": "GENERATED",
          "period": "2020-07",
          "header": {
            "credit_line_id": "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
            "user": {"id": "usr-2LlzusFUb3CCg6q8HjpCu9lvHcH"},
            "balance": {
              "local_amount": "3577.50",
              "local_currency": "BRL",
              "minimum_local_amount": "357.50",
              "total_local_debt_amount": "3587.50",
              "period_consumption": "8500.00"
            }
          },
          "pdf_url": "https://example.com"
        }
      }
    |
  end

  def search_account_statements_request do
    %SearchAccountStatementsType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
      filter_status: "CREATED",
      filter_period_from: "2023-03",
      filter_period_to: "2023-04",
      include: "rates,limits",
      page_size: "10",
      page_number: "2",
      sort: "status,-period"
    }
  end

  def search_account_statements_response do
    ~s|
      {
        "meta": {
          "pagination": {
            "total_pages": 1,
            "current_page": 1,
            "page_size": 10
          }
        },
        "data": [
          {
            "id": "lst-2Lm1ZH2rmhP6F1NRRBRneXAmpLe",
            "status": "GENERATED",
            "period": "2020-07",
            "header": {
              "credit_line_id": "lcr-2Lm1P1BcJXkAxaseQJjAeXAMple",
              "user": {"id": "usr-2LlzusFUb3CCg6q8HjpCeXAmpLe"},
              "balance": {
                "local_amount": "3577.50",
                "local_currency": "BRL",
                "minimum_local_amount": "357.50"
              }
            }
          }
        ]
      }
    |
  end

  def get_last_statements_request do
    %GetLastStatementsType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe"
    }
  end

  def get_last_statements_response do
    ~s|
      {
        "data": {
          "id": "lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP",
          "status": "GENERATED",
          "period": "2020-07",
          "header": {
            "credit_line_id": "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
            "user": {"id": "usr-2LlzusFUb3CCg6q8HjpCu9lvHcH"},
            "balance": {
              "local_amount": "3577.50",
              "local_currency": "BRL",
              "minimum_local_amount": "357.50"
            }
          }
        }
      }
    |
  end

  def get_following_statements_request do
    %GetFollowingStatementsType{
      token: "fRwX12Dg3345AD",
      credit_line_id: "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe"
    }
  end

  def get_following_statements_response do
    ~s|
      {
        "data": {
          "id": "lst-2Lm1ZH2rmhP6F1NRRBRnpUwswwP",
          "status": "GENERATED",
          "period": "2020-07",
          "header": {
            "credit_line_id": "lcr-2HMvRUOZ9C3fbsrkdeyOexAmpLe",
            "user": {"id": "usr-2LlzusFUb3CCg6q8HjpCu9lvHcH"},
            "balance": {
              "local_amount": "3577.50",
              "local_currency": "BRL",
              "minimum_local_amount": "357.50"
            }
          }
        }
      }
    |
  end
end
