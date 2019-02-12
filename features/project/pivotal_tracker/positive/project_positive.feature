@positive
Feature: Project Acceptance Test

  @create_project @delete_project
  Scenario: Update project name and iter
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "name": "Test name ✅",
      "iteration_length": 1
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Update project point scale
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "name": "Test name ✅",
      "point_scale": "0,1,2,3,5,8"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Update project boolean
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "bugs_and_chores_are_estimatable": false,
      "automatic_planning": false,
      "enable_tasks": false
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_project @delete_project
  Scenario: Update project date
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "start_date": "2009-11-30",
      "time_zone": {"offset": "-03:00"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @create_project @delete_project
  Scenario: Update different project TZ
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "start_date": "2009-11-30",
      "time_zone": {"olson_name": "America/Santiago"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @create_project @delete_project
  Scenario: Update project velocity
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "initial_velocity": 1,
      "velocity_averaged_over": 4
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @create_project @delete_project
  Scenario: Update project type
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "project_type": "shared"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @create_project @delete_project @bug
  Scenario: Update project status
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "status": "open"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @create_project @delete_project @bug
  Scenario Outline: Update project week start day
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "week_start_day": "<days>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data
    Examples:
      | days      |
      | Sunday    |
      | Monday    |
      | Tuesday   |
      | Wednesday |
      | Friday    |
      | Saturday  |

  @create_project @delete_project @bug
  Scenario: Update project time zone
    Given I set up a "PUT" request to "/projects/{project_id}" endpoint
    And I set up the data
    """
    {
      "time_zone": {"olson_name": "America/La_Paz", "offset": "-03:00"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data
