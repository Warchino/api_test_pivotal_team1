Feature: Project Acceptance Test

  @create_project
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/{project_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema

  @create_project
  Scenario: Put an specified project
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "name": "Test data"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_project
  Scenario: Delete an specified project
    Given I set up a "DELETE" request to "/projects/{project_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if was deleted
