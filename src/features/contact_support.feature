Feature: Contact Support
  As a user
  I want to contact support
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the support page

  Scenario: Successfully contact support
    When I enter valid information to contact support
    And I submit the form
    Then I should see a confirmation message
    And the support should be saved

  Scenario: contact support using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the support should be saved without error

  Scenario: Attempt to contact support with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to contact support with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the support page

  Scenario: Navigate away and return to resume contact support
    When I start to contact support
    And I leave the page before submitting
    And I return to the support page
    Then my previous input should be restored if autosave is enabled
