@negative
Feature: new feature

  @read_account @post_membership_account @delete_data
  Scenario: Set String value where there must be a boolean value in admin privileges of a member
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "admin": "admin",
        "project_creator": true
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error

  @read_account @post_membership_account @delete_data
  Scenario: Set String value where there must be a boolean value in project creator privileges of a member
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "admin": true,
        "project_creator": ""
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error

  @read_account @post_membership_account @delete_data
  Scenario: Set String value where there must be a boolean value in time keeper privileges of a member
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "admin": true,
        "project_creator": true,
        "timekeeper": 22
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error

  @read_account @post_membership_account @delete_data
  Scenario: Set String value where there must be a boolean value in time enterer privileges of a member
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "admin": true,
        "project_creator": true,
        "timekeeper": true,
        "time_enterer": "false"
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error
