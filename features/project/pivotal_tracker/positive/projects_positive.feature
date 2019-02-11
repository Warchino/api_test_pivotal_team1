@positive
Feature: Projects Positive Test

  @read_project @delete_project
  Scenario: create project name and iter
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "project name",
      "iteration_length": 1
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @read_project @delete_project
  Scenario: Update project point scale
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "project name",
      "point_scale": "0,1,2,3,5,8"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @read_project @delete_project
  Scenario: Update project boolean
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "project name",
      "bugs_and_chores_are_estimatable": true,
      "automatic_planning": true,
      "enable_tasks": true
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @read_project @delete_project
  Scenario: Update project date
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "project name",
      "start_date": "2009-11-30",
      "time_zone": {"offset": "-03:00"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @read_project @delete_project
  Scenario: Update different project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
       "name": "project name",
      "start_date": "2009-11-30",
      "time_zone": {"olson_name": "America/Santiago"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data

  @read_project @delete_project
  Scenario: Update project type
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name":"project name",
      "project_type": "private"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent project data
