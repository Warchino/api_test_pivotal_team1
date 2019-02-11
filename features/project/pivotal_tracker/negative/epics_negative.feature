@negative
Feature: Epics negative testing

#  @create_project @delete_project
#  Scenario: Create a new epic with description and label
#    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name":"Epic positive",
#      "description":"This is a new epic with desc",
#      "label":{"name":"pick this"}
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Epics-Creation" schema
#    And I verify the sent data of epics
#
#  @create_project @delete_project
#  Scenario: Create a new epic with description emojis
#    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name":"Epic positive",
#      "description":"😂🙊"
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Epics-Creation" schema
#    And I verify the sent data of epics
#
#  @create_project @delete_project
#  Scenario: Create a new epic with label name as emoji
#    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name":"Epic positive",
#      "label":{"name":"😂🙊"}
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Epics-Creation" schema
#    And I verify the sent data of epics
#
#
#  @create_project @delete_project
#  Scenario: Create a new epic with emojis
#    Given I set up a "POST" request to "/projects/{project_id}/epics" endpoint
#    And I set up the data
#    """
#    {
#      "name":"😂🙊🙏✂"
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Epics-Creation" schema
#    And I verify the sent data of epics
