@smoke
Feature: Get account

  @read_account
  Scenario: Get Account
    Given I set up a "GET" request to "/accounts/{account_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Get accounts where user is owner or admin
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Get account summaries
    Given I set up a "GET" request to "/account_summaries?with_permission=project_creation" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Get memberships of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account @post_membership_account @delete_data
  Scenario: Get a memberships of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I send the request
    Then I get a "200" status code as response



