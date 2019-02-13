@acceptance
Feature: Project Integration Acceptance

  @create_project @delete_project
  Scenario: Read an specified project integration
    Given I set up a "GET" request to "/projects/{project_id}/integrations" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project-Integrations" schema
