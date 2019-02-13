@acceptance
Feature: Manage memberships in an account

  @read_account @delete_data
  Scenario: Update by add a membership in an account
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com"
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @post_membership_account @delete_data
  Scenario: Update a membership in an account
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I set up the data
    """
      {
        "project_creator": true,
        "admin": false
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data

  @read_account @post_membership_account
  Scenario: Delete a member from an account
    Given I set up a "DELETE" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if item was deleted
