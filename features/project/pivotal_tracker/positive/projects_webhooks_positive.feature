@positive
Feature: post webhooks of Project

  @create_project @delete_project
  Scenario Outline: Post webhooks an specified project with  person_id
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
    And I verify the sent data url

    Examples:
      | webhook_url              | webhook_version |
      | https://www.facebook.com | v5              |
      | faceboo                  | v5              |
      | 123456                  | v5              |
