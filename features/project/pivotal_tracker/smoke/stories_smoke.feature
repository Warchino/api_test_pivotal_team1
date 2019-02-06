@smoke
Feature: Stories

  @create_project
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

  Scenario: Get Stories
    Given I set up a "GET" request to "/projects/{project_id}/stories" endpoint
    When I send the request
    Then I get a "200" status code as response
