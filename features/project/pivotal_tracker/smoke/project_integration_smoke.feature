@smoke
Feature: Project Integration

  @create_project
  Scenario: Get an specified project integration
    Given I set up a "GET" request to "/projects/{project_id}/integrations" endpoint
    When I send the request
    Then I get a "200" status code as response

#  Scenario: Post an specified project integration
#    Given I set up a "POST" request to "/projects/{project_id}/integrations" endpoint
#    And I set up the data
#    """
#    {
#      "active":false,
#      "base_url":"http://some.th/ing",
#      "name":"something",
#      "type":"other"
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
