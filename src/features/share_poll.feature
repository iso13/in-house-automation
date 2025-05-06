Feature: Share Poll
  As a user
  I want to share poll
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the poll page

  Scenario: Successfully share poll
    When I enter valid information to share poll
    And I submit the form
    Then I should see a confirmation message
    And the poll should be saved

  Scenario: share poll using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the poll should be saved without error

  Scenario: Attempt to share poll with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to share poll with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the poll page

  Scenario: Navigate away and return to resume share poll
    When I start to share poll
    And I leave the page before submitting
    And I return to the poll page
    Then my previous input should be restored if autosave is enabled
