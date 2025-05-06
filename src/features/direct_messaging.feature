Feature: Direct Messaging
  As a user
  I want to direct messaging
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the messaging page

  Scenario: Successfully direct messaging
    When I enter valid information to direct messaging
    And I submit the form
    Then I should see a confirmation message
    And the messaging should be saved

  Scenario: direct messaging using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the messaging should be saved without error

  Scenario: Attempt to direct messaging with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to direct messaging with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the messaging page

  Scenario: Navigate away and return to resume direct messaging
    When I start to direct messaging
    And I leave the page before submitting
    And I return to the messaging page
    Then my previous input should be restored if autosave is enabled
