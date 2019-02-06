Feature: Account acceptance test

  @read_account
  Scenario: Get an account
    Given I set up a "GET" request to "/accounts/{account_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account" schema

  Scenario: Get accounts where user is owner or admin
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Accounts" schema
