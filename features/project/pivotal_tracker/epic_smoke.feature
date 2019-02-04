@smoke
Feature: Epic feature

  @create_project @create_epic
  Scenario: Get an specific epic
    Given I set up a "GET" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_epic
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

  @create_epic
  Scenario: Delete an specific epic
    Given I set up a "DELETE" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "204" status code as response