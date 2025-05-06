Feature: Follow Other Users
  As a user
  I want to follow other users
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the users page

  Scenario: Successfully follow other users
    When I enter valid information to follow other users
    And I submit the form
    Then I should see a confirmation message
    And the users should be saved

  Scenario: follow other users using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the users should be saved without error

  Scenario: Attempt to follow other users with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to follow other users with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the users page

  Scenario: Navigate away and return to resume follow other users
    When I start to follow other users
    And I leave the page before submitting
    And I return to the users page
    Then my previous input should be restored if autosave is enabled
