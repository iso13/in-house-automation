Feature: Search Workplace
  As a user
  I want to search workplace
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the workplace page

  Scenario: Successfully search workplace
    When I enter valid information to search workplace
    And I submit the form
    Then I should see a confirmation message
    And the workplace should be saved

  Scenario: search workplace using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the workplace should be saved without error

  Scenario: Attempt to search workplace with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to search workplace with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the workplace page

  Scenario: Navigate away and return to resume search workplace
    When I start to search workplace
    And I leave the page before submitting
    And I return to the workplace page
    Then my previous input should be restored if autosave is enabled
