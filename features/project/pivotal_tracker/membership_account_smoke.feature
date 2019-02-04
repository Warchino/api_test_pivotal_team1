Feature: Add a member to an account and delete it

  @read_account @post_membership_account @delete_data
  Scenario: Modify data of a member in an account
    Given I set up a "PUT" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    And I set up the data
      """
      {
        "project_creator": true
      }
      """
    When I send the request
    Then I get a "200" status code as response

  @post_membership_account
  Scenario: Delete a member from an account
    Given I set up a "DELETE" request to "/accounts/{account_id}/memberships/{member_id}" endpoint
    When I send the request
    Then I get a "204" status code as response

  @delete_data
  Scenario: Add a membership to an account
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    And I set up the data
      """
      {
        "person_id": 3143926
      }
      """
    When I send the request
    Then I get a "200" status code as response
