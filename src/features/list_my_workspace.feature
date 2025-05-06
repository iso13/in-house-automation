Feature: List My Workspace
  As a user
  I want to list my workspace
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the workspace page

  Scenario: Successfully list my workspace
    When I enter valid information to list my workspace
    And I submit the form
    Then I should see a confirmation message
    And the workspace should be saved

  Scenario: list my workspace using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the workspace should be saved without error

  Scenario: Attempt to list my workspace with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to list my workspace with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the workspace page

  Scenario: Navigate away and return to resume list my workspace
    When I start to list my workspace
    And I leave the page before submitting
    And I return to the workspace page
    Then my previous input should be restored if autosave is enabled
