@positive
Feature: Manage memberships in an account

  @read_account @delete_data
  Scenario: Add a membership in an account with an email, name and initials
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "initials": "NE"
      }
    """  
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data
  Scenario: Add a membership in an account with an email, name and admin privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data
  Scenario: Add a membership in an account with an email, name and admin privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member
