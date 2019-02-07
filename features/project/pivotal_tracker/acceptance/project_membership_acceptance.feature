@acceptance
Feature: Get memeberships of Project

  @create_project @create_memberships_project @delete_project
  Scenario: Get memberships of specific Project
    Given I set up a "GET" request to "/projects/{project_id}/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project-Memberships" schema


  @create_project @delete_project
  Scenario: Post memberships an specified project
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": 3143926,
      "role": "member"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project-Memberships-Creation" schema
    And I verify the sent data of membership
