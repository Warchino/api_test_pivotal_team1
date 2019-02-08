@acceptance
Feature: Modify configuration of member in an account

  @read_account @post_membership_account @delete_data
  Scenario: Give privileges to a member in an account
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "admin": true,
        "project_creator": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Members" schema
    And I verify the sent data

  @read_account @post_membership_account @delete_data
  Scenario: Give admin privileges without project creator privileges to a member in an account
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "project_creator": false,
        "admin": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Members" schema
    And I verify the sent data

  @read_account @post_membership_account @delete_data
  Scenario: quite privileges to a member in an account
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "project_creator": false,
        "admin": false
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Members" schema
    And I verify the sent data
