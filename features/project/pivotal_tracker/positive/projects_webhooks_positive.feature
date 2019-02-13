@positive
Feature: Webhooks Positive Test

  @create_project @delete_project
  Scenario Outline: Create webhooks an specified project with  person_id
    Given I set up a "POST" request to "/projects/{project_id}/webhooks" endpoint
    And I set up the data
    """
    {
      "webhook_url": "<webhook_url>",
      "webhook_version": "<webhook_version>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Webhooks-Creation" schema
    And I verify the sent data url

    Examples:
      | webhook_url              | webhook_version |
      | https://www.facebook.com | v5              |
      | facebook                 | v5              |
      | 123456                   | v5              |
