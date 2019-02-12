@negative
Feature: Stories Negative Test

  @create_project @delete_project
  Scenario: Create a new story with null name
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":""
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Blank" error

  @create_project @delete_project
  Scenario: Create a new story with int name
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":1
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Should_be-extended_string" error

  @create_project @delete_project
  Scenario: Create a new story with huge name length
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"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"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Long-extended_string" error

  @create_project @delete_project
  Scenario: Create a new story with wrong id
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "nae":"a"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Require-parameter" error

  @create_project @delete_project
  Scenario: Create a new story with wrong story type
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "story_type":"feture"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with null story type
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "story_type":""
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with int story type
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "story_type": 2
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with wrong current_state
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "current_state": "abc"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with wrong current_state
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "current_state": "abc"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with null current_state
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "current_state": null
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with int value current_state
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "current_state": 1
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project  @wip
  Scenario: Create a new story with wrong estimate
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "estimate": 0.17E1
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project  @wip
  Scenario: Create a new story with null estimate
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "estimate": null
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-one" error

  @create_project @delete_project
  Scenario: Create a new story with string estimate
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "estimate": "a"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Must_be-number" error

  @create_project @delete_project
  Scenario: Create a new story with wrong accepted_at
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "accepted_at": "a"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "ISO-date_milli" error

  @create_project @delete_project
  Scenario: Create a new story with correct accepted_at but not accepted
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "accepted_at": "2013-04-30T04:25:15Z"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Accepted_date" error

  @create_project @delete_project @wip
  Scenario: Create a new story with correct int accepted_at but not accepted
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "accepted_at": 999999999999999
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Accepted_date" error

  @create_project @delete_project
  Scenario: Create a new story with wrong deadline
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "deadline": "a"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "ISO-date_milli" error

  @create_project @delete_project
  Scenario: Create a new story with correct deadline but not release type
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "deadline": "2020-04-30T04:25:15Z"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Deadline" error

  @create_project @delete_project @wip
  Scenario: Create a new story with correct int deadline but not accepted
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "deadline": 999999999999999
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Accepted_date" error


  @create_project @delete_project
  Scenario: Create a new story with wrong created_at
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "created_at": "a"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "ISO-date_milli" error

  @create_project @delete_project @wip
  Scenario: Create a new story with future created_at
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "created_at": "2020-04-30T04:25:15Z"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Future-created_at" error

  @create_project @delete_project @wip
  Scenario: Create a new story with correct past date created_at
    Given I set up a "POST" request to "/projects/{project_id}/stories" endpoint
    And I set up the data
    """
    {
      "name":"story",
      "created_at": 99999999
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error" schema
    And I validate the "Accepted_date" error
