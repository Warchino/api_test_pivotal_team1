#Feature: Create Items
#
#  Scenario: Create Items
#    Given I set up a "POST" request to "/items.json" endpoint
#    And I set up the data
#      """
#      {
#      "Content": "New Item creation"
#      }
#      """
#    When I send the request
#    Then I get a "200" status code as response
#    And I verify the sent data