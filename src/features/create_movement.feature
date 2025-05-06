Feature: Create Movement
  As a user
  I want to create movement
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the movement page

  Scenario: Successfully create movement
    When I enter valid information to create movement
    And I submit the form
    Then I should see a confirmation message
    And the movement should be saved

  Scenario: create movement using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the movement should be saved without error

  Scenario: Attempt to create movement with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to create movement with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the movement page

  Scenario: Navigate away and return to resume create movement
    When I start to create movement
    And I leave the page before submitting
    And I return to the movement page
    Then my previous input should be restored if autosave is enabled
