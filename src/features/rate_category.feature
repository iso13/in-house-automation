Feature: Rate Category
  As a user
  I want to rate category
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the category page

  Scenario: Successfully rate category
    When I enter valid information to rate category
    And I submit the form
    Then I should see a confirmation message
    And the category should be saved

  Scenario: rate category using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the category should be saved without error

  Scenario: Attempt to rate category with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to rate category with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the category page

  Scenario: Navigate away and return to resume rate category
    When I start to rate category
    And I leave the page before submitting
    And I return to the category page
    Then my previous input should be restored if autosave is enabled
