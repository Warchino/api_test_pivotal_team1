@positive
Feature: Positive story task tests

  @create_project @create_story @delete_project
  Scenario: Return a task created with description and completed
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "My task.",
      "complete": true
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @delete_project
  Scenario: Return a task created with description and position
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "Task 1",
      "position": 1
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @delete_project
  Scenario: Return a task created with description, position and not completed
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "Task 1",
      "position": 1,
      "complete": false
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data
