@rateHouse
Feature: Rate House
As an Insider
I want to rate houses on various aspects
So that I can provide feedback and improve the quality of my ratings

Scenario: Rate People
    Given I launch in-house
    And the user has selected a workspace
    And the user selects the "insider" relationship type
    And the user submits a single word identifier
    When the user acknowledges the confirmation
    Then I should be able to rate
