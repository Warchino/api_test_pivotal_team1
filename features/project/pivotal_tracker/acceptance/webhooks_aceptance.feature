@acceptance
Feature: Get Webhooks of projects

  @create_project @create_webhooks @delete_project
  Scenario: Read webhooks of an specified project
    Given I set up a "GET" request to "/projects/{project_id}/webhooks" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Webhooks" schema

  @create_project @delete_project
  Scenario: Create webhooks an specified project
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
    And I validate with "Webhooks-Creation" schema
    And I verify the sent data


