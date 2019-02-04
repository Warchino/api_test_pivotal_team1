@smoke
Feature: Get Story Transitions

  @create_project
  Scenario: Get Story transitions
    Given I set up a "GET" request to "/projects/{project_id}/story_transitions" endpoint
    When I send the request
    Then I get a "200" status code as response