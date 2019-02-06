@acceptance
Feature: Epic feature

  @create_project @create_epic @delete_project
  Scenario: Get an specific epic
    Given I set up a "GET" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema

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
    And I validate with "Epic" schema
    And I verify the sent data

  @create_project @create_epic @delete_project
  Scenario: Delete an specific epic
    Given I set up a "DELETE" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if epic was deleted
