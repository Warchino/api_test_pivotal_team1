@acceptance
Feature: Manage tasks from a story in a project

  @create_project @create_story @create_task @delete_project
  Scenario: Read tasks of an story
    Given I set up a "GET" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Tasks" schema

  @create_project @create_story @delete_project
  Scenario: Update a task created by description
    Given I set up a "POST" request to "/projects/{project_id}/stories/{story_id}/tasks" endpoint
    And I set up the data
    """
      {
      "description": "Task created in PyCharm"
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @create_task @delete_project
  Scenario: Read an specific task
    Given I set up a "GET" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema

  @create_project @create_story @create_task @delete_project
  Scenario: Update an specific task by complete
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    And I set up the data
    """
      {
      "complete": true
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_project @create_story @create_task @delete_project
  Scenario: Delete an specific task
    Given I set up a "DELETE" request to "/projects/{project_id}/stories/{story_id}/tasks/{task_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if item was deleted
