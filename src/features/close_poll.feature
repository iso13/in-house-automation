Feature: Close Poll
  As a user
  I want to close poll
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the poll page

  Scenario: Successfully close poll
    When I enter valid information to close poll
    And I submit the form
    Then I should see a confirmation message
    And the poll should be saved

  Scenario: close poll using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the poll should be saved without error

  Scenario: Attempt to close poll with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to close poll with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the poll page

  Scenario: Navigate away and return to resume close poll
    When I start to close poll
    And I leave the page before submitting
    And I return to the poll page
    Then my previous input should be restored if autosave is enabled
