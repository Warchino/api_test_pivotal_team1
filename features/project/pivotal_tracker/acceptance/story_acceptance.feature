@acceptance
Feature: Story Feature of pivotal tracker

  @create_project @create_story @delete_project
  Scenario: Read an specific story
    Given I set up a "GET" request to "/projects/{project_id}/stories/{story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema

  @create_project @create_story @delete_project
  Scenario: Update an specific story by label
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the data
    """
    {
      "labels":
      [
        {"name":"newnew"}
      ]
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent labels

  @create_project @create_story @delete_project
  Scenario: Delete an specific story
    Given I set up a "DELETE" request to "/projects/{project_id}/stories/{story_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if item was deleted
