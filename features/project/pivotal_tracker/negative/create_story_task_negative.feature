@negative
Feature: Negative tests for create a story task

  @create_project @create_story @delete_project
  Scenario: I create a story task with description string greater than 1000
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh1000MoreTh10001"
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Long-extended_string" error

  @create_project @create_story @delete_project
  Scenario: I create a story task without description
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "complete": true
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Missing-Param" error

  @create_project @create_story @delete_project
  Scenario: I create a story task with blank description
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": ""
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Blank" error

  @create_project @create_story @delete_project
  Scenario: I create a story task with out-of-range position
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "position": 2
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error-Req" schema

  @create_project @create_story @delete_project
  Scenario: I create a story task with non-integer position
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "position": true
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-integer" error

  @create_project @create_story @delete_project @bug
  Scenario: I create a story task with zero position
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "position": 0
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error-Req" schema

  @create_project @create_story @delete_project @bug
  Scenario: I create a story task with negative number position
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "position": -3
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error-Req" schema

  @create_project @create_story @delete_project
  Scenario: I create a story task with non-valid-type complete
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "complete": "true"
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error

  @create_project @create_story @delete_project
  Scenario: I create a story task with non-valid-type complete
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "out of range",
      "complete": 2
      }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Non-String_Boolean" error
