@smoke
Feature: Get Story Transitions

  @create_project @create_story @delete_project
  Scenario: Read Story transitions
    Given I set up a "GET" request to "/projects/{project_id}/story_transitions" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project @create_story @delete_project
  Scenario: Read Story transitions by story_id
    Given I set up a "GET" request to "/projects/{project_id}/stories/{story_id}/transitions" endpoint
    When I send the request
    Then I get a "200" status code as response
