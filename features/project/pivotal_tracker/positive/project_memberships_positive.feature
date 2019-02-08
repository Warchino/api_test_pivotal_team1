@positive
Feature: Get memberships of Project

  @create_project @delete_project
  Scenario: Post memberships an specified project whit role member and person_id
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
    And I verify the sent data of membership


  @create_project @delete_project
  Scenario: Post memberships an specified project whit role member and email
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "email": "NeatImp@mailinator.com",
      "role": "member"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership by email


  @create_project @delete_project
  Scenario: Post memberships an specified project whit role viewer and person_id
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": 3143926,
      "role": "viewer"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership


  @create_project @delete_project
  Scenario: Post memberships an specified project whit role viewer and email
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "email": "NeatImp@mailinator.com",
      "role": "viewer"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership by email


   @create_project @delete_project
  Scenario: Post memberships an specified project whit role owner and person_id
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": 3143926,
      "role": "owner"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership


  @create_project @delete_project
  Scenario: Post memberships an specified project whit role owner and email
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "email": "NeatImp@mailinator.com",
      "role": "owner"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership by email