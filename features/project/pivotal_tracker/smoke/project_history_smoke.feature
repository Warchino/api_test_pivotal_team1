@smoke
Feature: Project History

  @create_project
  Scenario: Get an specified project history
    Given I set up a "GET" request to "/projects/{project_id}/history/days" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Get project snapshot
    Given I set up a "GET" request to "/projects/{project_id}/history/snapshots" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Get iterations daily history
    Given I set up a "GET" request to "/projects/{project_id}/history/iterations/1/days" endpoint
    When I send the request
    Then I get a "200" status code as response