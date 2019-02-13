@smoke
Feature: Account smoke

  @read_account
  Scenario: Read Account ID
    Given I set up a "GET" request to "/accounts/{account_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Read accounts where user is owner or admin
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Read account summaries
    Given I set up a "GET" request to "/account_summaries?with_permission=project_creation" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account
  Scenario: Read memberships of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_account @post_membership_account @delete_data
  Scenario: Read a memberships of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
