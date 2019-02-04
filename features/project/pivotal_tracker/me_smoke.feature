@smoke
Feature: Me API pivotal tracker

  Scenario: Get Me
    Given I set up a "GET" request to "/me" endpoint
    When I send the request
    Then I get a "200" status code as response