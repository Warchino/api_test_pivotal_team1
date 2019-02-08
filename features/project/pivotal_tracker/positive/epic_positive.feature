@positive
Feature: Positive test of Epic feature

  @create_project @create_epic @delete_project
  Scenario: Update epic name label description
    Given I set up a "PUT" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name": "New epic",
      "description": "HI everybody",
      "label":{"name":"ztr"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics

  @create_project @create_epic @delete_project
  Scenario: Update epic with new name
    Given I set up a "PUT" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name": "New epic"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data

  @create_project @create_epic @delete_project
  Scenario: Update epic new name and description
    Given I set up a "PUT" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "name": "New epic",
      "description": "HI everybody"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data

  @create_project @create_epic @delete_project
  Scenario: Update epic label
    Given I set up a "PUT" request to "/projects/{project_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
      "label":{"name":"ztr"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics
