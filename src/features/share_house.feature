Feature: Share House
  As a user
  I want to share house
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the house page

  Scenario: Successfully share house
    When I enter valid information to share house
    And I submit the form
    Then I should see a confirmation message
    And the house should be saved

  Scenario: share house using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the house should be saved without error

  Scenario: Attempt to share house with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to share house with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the house page

  Scenario: Navigate away and return to resume share house
    When I start to share house
    And I leave the page before submitting
    And I return to the house page
    Then my previous input should be restored if autosave is enabled
