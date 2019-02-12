@positive
Feature: Story Feature of pivotal tracker

  @create_project @create_story @delete_project
  Scenario: Update an specific story
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the data
    """
    {
      "labels":
      [
        {"name":"newnew"}
      ]
    }
    """

    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent labels

  @create_project @create_story @delete_project
  Scenario: Update an specific story
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the data
    """
       {
         "labels":[]
       }
    """

    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent labels

  @create_project @create_story @delete_project
  Scenario Outline: Update an specific story
    Given I set up a "PUT" request to "/projects/{project_id}/stories/{story_id}" endpoint
    And I set up the data
    """
        {
          "current_state":"<current_state>",
          "estimate":2,
          "name":"change name "
         }
    """

    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
    Examples:
      | current_state |
      | accepted      |
      | delivered     |
      | finished      |
      | started       |
      | rejected      |
      | unstarted     |
      | unscheduled   |