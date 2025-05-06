Feature: Share Anonymously
  As a user
  I want to share anonymously
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the anonymously page

  Scenario: Successfully share anonymously
    When I enter valid information to share anonymously
    And I submit the form
    Then I should see a confirmation message
    And the anonymously should be saved

  Scenario: share anonymously using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the anonymously should be saved without error

  Scenario: Attempt to share anonymously with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to share anonymously with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the anonymously page

  Scenario: Navigate away and return to resume share anonymously
    When I start to share anonymously
    And I leave the page before submitting
    And I return to the anonymously page
    Then my previous input should be restored if autosave is enabled
