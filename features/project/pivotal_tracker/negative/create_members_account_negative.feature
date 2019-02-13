@negative
Feature: negative tests for update a member in an account

  @read_account @delete_data
  Scenario: Add a membership with only name
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "name": "blablablablablablablablabla"
      }
    """
    And I send the request
    Then I get a "400" status code as response

  @read_account @delete_data
  Scenario: Add a membership with a non-email word in email field
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Member-Values" error

  @read_account @delete_data @bug
  Scenario: Add a membership with different name than name assigned to email
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "name"
      }
    """
    And I send the request
    Then I get a "404" status code as response

  @read_account @delete_data
  Scenario: Add a membership with very long name
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "SuperChap@mailinator.com",
        "name": "namedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Member-Values" error

  @read_account @delete_data @bug
  Scenario: Add a membership with initials grater than 10 characters
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "MiniDanger@mailinator.com",
        "name": "name",
        "initials": "mailinatorcommailinatorcommailinatorcommailinatorcommailinatorcommailinatorcommailinatorcommailinator"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema

  @read_account @delete_data
  Scenario: Add a membership with created_at field wrong
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "email": "SugarDude@mailinator.com",
        "created_at": "a"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "ISO-date_milli" error

  @read_account @delete_data
  Scenario: Add a membership with a non-existent person id
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 53143926
      }
    """
    And I send the request
    Then I get a "404" status code as response

  @read_account @delete_data
  Scenario: Add a membership with a wrong person_id type
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": "new id"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-integer" error

  @read_account @delete_data
  Scenario: Add a membership with person_id and email
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "email": "NeatImp@mailinator.com"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "ID-email" error

  @read_account @delete_data
  Scenario: Add a membership with wrong params in the body request
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "my": "hache"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Parameter" error

  @read_account @delete_data @bug
  Scenario: Add a membership with wrong params in the body request
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "owner": true
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Parameter" error

  @read_account @delete_data @bug
  Scenario: Add a membership with wrong params in the body request
    Given I set up a "POST" request to "/accounts/{account_id}/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "owner": "True"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Parameter" error
