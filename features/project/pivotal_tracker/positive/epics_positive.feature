@positive
Feature: Epics positive

  @create_project @delete_project
  Scenario: Create a new epic
    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
    And I set up the data
    """
    {
      "name":"Tractor Beams"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epics-Creation" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/{project_id}/epics" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epics" schema
