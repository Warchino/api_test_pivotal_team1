@acceptance
Feature: Project History Acceptance Test

  @create_project @delete_project
  Scenario: Read an specified history of project
    Given I set up a "GET" request to "/projects/{project_id}/history/days" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project-History" schema
    And I validate the date data of project history
