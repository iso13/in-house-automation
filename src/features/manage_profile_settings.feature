Feature: Manage Profile Settings
  As a user
  I want to manage profile settings
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the settings page

  Scenario: Successfully manage profile settings
    When I enter valid information to manage profile settings
    And I submit the form
    Then I should see a confirmation message
    And the settings should be saved

  Scenario: manage profile settings using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the settings should be saved without error

  Scenario: Attempt to manage profile settings with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to manage profile settings with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the settings page

  Scenario: Navigate away and return to resume manage profile settings
    When I start to manage profile settings
    And I leave the page before submitting
    And I return to the settings page
    Then my previous input should be restored if autosave is enabled
