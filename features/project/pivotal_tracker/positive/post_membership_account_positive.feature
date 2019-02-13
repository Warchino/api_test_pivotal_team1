@positive
Feature: Manage memberships in an account

  @read_account @delete_data
  Scenario: Create a member in an account with an email, name and initials
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
  Scenario: Create a member in an account with an email, name and admin privileges
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
  Scenario: Create a member in an account with an id and admin privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data
  Scenario: Create a member in an account with an id and create project privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "project_creator": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data
  Scenario: Create a member in an account with an id, admin privileges but not create project privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "project_creator": false,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data
  Scenario: Create a member in an account with email, name, initials, admin privileges but not create project privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "initials": "NE",
        "project_creator": false,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I verify the sent data of member

  @read_account @delete_data @bug
  Scenario: Create a member in an account with email, name, initials, admin privileges but not create project privileges
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "initials": "NE",
        "created_at": "2019-02-14T04:25:15Z",
        "project_creator": false,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
