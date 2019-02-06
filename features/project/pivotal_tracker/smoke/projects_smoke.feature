@smoke
Feature: Get Projects

  @create_project @delete_project
  Scenario: Get Projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response

  @read_project @delete_project
  Scenario: Put an specified project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "Test project creation"
    }
    """
    When I send the request
    Then I get a "200" status code as response