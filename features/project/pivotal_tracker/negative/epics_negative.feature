@negative
Feature: Epics negative testing

  @create_project @delete_project
  Scenario: Create a new epic with huge name
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"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"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Long-extended_string" error

  @create_project @delete_project @bug
  Scenario: Create a new epic with null name
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":""
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Blank" error

  @create_project @delete_project
  Scenario: Create a new epic with null label name
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "label":{"name":""}
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Blank-label" error

  @create_project @delete_project @bug
  Scenario: Create a new epic with int label name
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "label":{"name":1}
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Blank-label" error

  @create_project @delete_project
  Scenario: Create a new epic with null label_id
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "label_id":1
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Nonexistent-label" error

  @create_project @delete_project
  Scenario: Create a new epic with string label_id
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "label_id":"1"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-integer" error

  @create_project @delete_project
  Scenario: Create a new epic with integer description
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "description": 1
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Should_be-extended_string" error

  @create_project @delete_project
  Scenario: Create a new epic with null point after_id
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "after_id": 10
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Cant_move" error

  @create_project @delete_project
  Scenario: Create a new epic with string point after_id
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"test",
      "after_id": "1"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-integer" error
