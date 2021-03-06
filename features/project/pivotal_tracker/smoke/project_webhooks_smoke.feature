@smoke
Feature: Get Project Webhooks

  @create_project @delete_project
  Scenario: Read Project Webhooks
    Given I set up a "GET" request to "/projects/{project_id}/webhooks" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project @delete_project
  Scenario: Create an specified project integration
    Given I set up a "POST" request to "/projects/{project_id}/webhooks" endpoint
    And I set up the data
    """
    {
      "webhook_url":"https://www.pivotaltracker.com",
      "webhook_version":"v5"
    }
    """
    When I send the request
    Then I get a "200" status code as response
