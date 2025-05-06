Feature: Delete Pollyes
  As a user
  I want to delete pollyes
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the pollyes page

  Scenario: Successfully delete pollyes
    When I enter valid information to delete pollyes
    And I submit the form
    Then I should see a confirmation message
    And the pollyes should be saved

  Scenario: delete pollyes using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the pollyes should be saved without error

  Scenario: Attempt to delete pollyes with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to delete pollyes with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the pollyes page

  Scenario: Navigate away and return to resume delete pollyes
    When I start to delete pollyes
    And I leave the page before submitting
    And I return to the pollyes page
    Then my previous input should be restored if autosave is enabled
