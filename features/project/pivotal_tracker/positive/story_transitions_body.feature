@positive
Feature: Get transitions of an specific story with query request

  @create_project @create_story @delete_project
  Scenario Outline: Update more story's  with body request
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the params
    """
    {
      "current_state": "unscheduled",
      "estimate": 2
    }
    """
    And I send the request
    And I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the params
    """
    {
      "current_state": "started"
    }
    """
    And I send the request
    And I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the params
    """
    {
      "current_state": "finished"
    }
    """
    And I send the request
    And I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the params
    """
    {
      "current_state": "delivered"
    }
    """
    And I send the request
    When I set up a "GET" request to "/projects/{project_id}/stories/{story_id}/transitions?limit=<limit>" endpoint
    And I send the request
    Then I get a "200" status code as response
    Then I compare <limit> with transitions
    And I compare states of limited transitions

    Examples:
      | limit|
      | 2    |
      | 3    |
      | 4    |
