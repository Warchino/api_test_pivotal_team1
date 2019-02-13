@positive
Feature: Create a new story in a project

  @create_project @delete_project
  Scenario: Create a new story
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Create a new story with description
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation",
      "description": "Story creation API test"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario Outline: Create a new story with different story type
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "story_type": "<type>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
    Examples:
      | type    |
      | feature |
      | bug     |
      | chore   |
      | release |

  @create_project @delete_project
  Scenario Outline: Create a new story with state variations
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "<state>",
      "story_type": "bug"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
    Examples:
      | state     |
      | started   |
      | finished  |
      | accepted  |
      | unstarted |

  @create_project @delete_project
  Scenario: Create a new story variant 1
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "started",
      "estimate": 2
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Create a new story variant 2
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "accepted",
      "story_type": "bug",
      "accepted_at": "2019-02-09T21:24:55Z"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Create a new story variant 3
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "unstarted",
      "story_type": "release"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Create a new story variant 4
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "accepted",
      "story_type": "release",
      "accepted_at": "2018-02-09T21:24:55Z",
      "deadline": "2010-02-09T21:24:55Z"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Create a new story variant 5
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"Story creation name",
      "description": "Story creation API test",
      "current_state": "accepted",
      "story_type": "release",
      "accepted_at": "2018-02-09T21:24:55Z",
      "deadline": "2010-02-09T21:24:55Z",
      "created_at": "2019-02-08T23:21:55Z"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
