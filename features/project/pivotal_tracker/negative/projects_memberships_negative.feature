@negative
Feature: created memberships of Project

  @create_project @delete_project
  Scenario Outline: Create memberships an specified project with  person_id out range
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": <person_id>,
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Person_id_out_range" error
    Examples:
      | person_id                                            | role   |
      | 3143922226                                           | viewer |
      | 3143922226333333333333333333333333333333333333333333 | viewer |


  @create_project @delete_project
  Scenario Outline: Create memberships an specified project with  invalid role
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": <person_id>,
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error
    Examples:
      | person_id | role     |
      | 3143926   | viewerw  |
      | 3143926   |          |
      | 3143926   | 12312312 |

  @create_project @delete_project
  Scenario: Create memberships an specified project with  noting values
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {


    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "At_least-one" error


  @create_project @delete_project
  Scenario: Create memberships an specified project with noting email
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "role": "viewer"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Email_blank" error

  @bug
  @create_project @delete_project
  Scenario: Create memberships an specified project with email already
    Given I set up a "POST" request to "/projects/{project_id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"rodrigo.menacho@fundacion-jala.org",
      "role": "viewer"

    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Already_member_project" error
