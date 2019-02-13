@acceptance
Feature: Stories Acceptance

  @create_project @delete_project
  Scenario: Create a new story
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @create_story @delete_project
  Scenario: Read Stories
    Given I set up a "GET" request to "/projects/{project_id}/stories" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all the stories with the schema

  @create_project @create_story @delete_project
  Scenario: Read story specified in id parameter
    Given I set up a "GET" request to "/projects/{project_id}/stories/bulk?ids={story_id}" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I verify all the stories with the schema
