@acceptance
Feature: Get Projects

  @create_project
  Scenario: Get Projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Projects" schema

  @read_project @delete_project
  Scenario: Post an specified project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "Test data"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data
