@positive
Feature: Get memberships of Project

  @create_project @delete_project
  Scenario Outline: Post memberships an specified project with  person_id
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": <person_id>,
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership
    Examples:
      | person_id | role   |
      | 3143926   | member |
      | 3143926   | owner  |
      | 3143926   | viewer |


  @create_project @delete_project
  Scenario Outline: Post memberships an specified project with email
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "email": "<email>",
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I verify the sent data of membership
    Examples:
      | email                  | role   |
      | NeatImp@mailinator.com | member |
      | NeatImp@mailinator.com | owner  |
      | NeatImp@mailinator.com | viewer |

