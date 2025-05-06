Feature: Manage Notifications
  As a user
  I want to manage notifications
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the notifications page

  Scenario: Successfully manage notifications
    When I enter valid information to manage notifications
    And I submit the form
    Then I should see a confirmation message
    And the notifications should be saved

  Scenario: manage notifications using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the notifications should be saved without error

  Scenario: Attempt to manage notifications with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to manage notifications with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the notifications page

  Scenario: Navigate away and return to resume manage notifications
    When I start to manage notifications
    And I leave the page before submitting
    And I return to the notifications page
    Then my previous input should be restored if autosave is enabled
