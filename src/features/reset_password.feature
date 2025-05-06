Feature: Reset Password
  As a user
  I want to reset password
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the password page

  Scenario: Successfully reset password
    When I enter valid information to reset password
    And I submit the form
    Then I should see a confirmation message
    And the password should be saved

  Scenario: reset password using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the password should be saved without error

  Scenario: Attempt to reset password with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to reset password with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the password page

  Scenario: Navigate away and return to resume reset password
    When I start to reset password
    And I leave the page before submitting
    And I return to the password page
    Then my previous input should be restored if autosave is enabled
