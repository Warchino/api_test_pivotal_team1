@smoke
Feature: Epic feature

  @create_project @create_epic @delete_project
  Scenario: Read an specific epic
    Given I set up a "GET" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project @create_epic @delete_project
  Scenario: Update an specific epic
    Given I set up a "PUT" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "description": "New description for test"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_project @create_epic @delete_project
  Scenario: Delete an specific epic
    Given I set up a "DELETE" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "204" status code as response

  @create_project @create_epic @delete_project
  Scenario: Read specified epic on epics
    Given I set up a "GET" request to "/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
