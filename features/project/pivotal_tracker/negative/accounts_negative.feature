Feature: Get account or list of accounts with non-existent ID

  @read_account
  Scenario: Try to access an account that doesn't belong to the profile
    Given I set up a "GET" request to "/accounts/100" endpoint
    When I send the request
    Then I get a "403" status code as response
    And I validate with "Authorization" schema
    And I validate the "Account-Access" error

  @read_account
  Scenario: Try to access an account that doesn't belong to the profile
    Given I set up a "GET" request to "/account_summaries?with_permission=Project_CREATIO" endpoint
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error
