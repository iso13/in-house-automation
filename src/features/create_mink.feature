Feature: Create Mink
  As a user
  I want to create mink
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the mink page

  Scenario: Successfully create mink
    When I enter valid information to create mink
    And I submit the form
    Then I should see a confirmation message
    And the mink should be saved

  Scenario: create mink using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the mink should be saved without error

  Scenario: Attempt to create mink with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to create mink with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the mink page

  Scenario: Navigate away and return to resume create mink
    When I start to create mink
    And I leave the page before submitting
    And I return to the mink page
    Then my previous input should be restored if autosave is enabled
