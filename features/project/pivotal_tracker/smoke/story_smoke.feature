@smoke
Feature: Story Feature of pivotal tracker

  @create_project @create_story @delete_project
  Scenario: Get an specific story
    Given I set up a "GET" request to "/projects/{project_id}/stories/{story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project @create_story @delete_project
  Scenario: Update an specific story
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the data
    """
    {
      "labels":
      [
        {"name":"newnew"},
        {"name":"labellabel"}
      ]
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_project @create_story @delete_project
  Scenario: Delete an specific story
    Given I set up a "DELETE" request to "/projects/{project_id}/stories/{story_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
