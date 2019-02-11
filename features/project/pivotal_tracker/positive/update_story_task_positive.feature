@positive
Feature: Update task's information

  @create_project @create_story @create_task @delete_project
  Scenario: Update description of an specific task
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    And I set up the data
    """
      {
      "description": "modified"
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @create_task @delete_project
  Scenario: Update description of an specific task
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    And I set up the data
    """
      {
      "description": "modified",
      "position": 1
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @create_task @delete_project
  Scenario: Update description of an specific task
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    And I set up the data
    """
      {
      "description": "modified",
      "position": 1,
      "complete": true
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data
