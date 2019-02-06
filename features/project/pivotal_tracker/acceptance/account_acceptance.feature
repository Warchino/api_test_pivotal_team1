@acceptancegit 
Feature: Account acceptance test

  @read_account
  Scenario: Get an account
    Given I set up a "GET" request to "/accounts/{account_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account" schema

  @read_account
  Scenario: Get accounts where user is owner or admin
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Accounts" schema

  @read_account
  Scenario: Get summary of account
    Given I set up a "GET" request to "/account_summaries?with_permission=project_creation" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Accounts_summary" schema

  @read_account
  Scenario: Get memberships of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Memberships_account" schema

  @read_account @post_membership_account @delete_data
  Scenario: Get a membership of an account
    Given I set up a "GET" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Members" schema
