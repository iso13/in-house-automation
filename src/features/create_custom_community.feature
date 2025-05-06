Feature: Create Custom Community
  As a user
  I want to create custom community
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the community page

  Scenario: Successfully create custom community
    When I enter valid information to create custom community
    And I submit the form
    Then I should see a confirmation message
    And the community should be saved

  Scenario: create custom community using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the community should be saved without error

  Scenario: Attempt to create custom community with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to create custom community with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the community page

  Scenario: Navigate away and return to resume create custom community
    When I start to create custom community
    And I leave the page before submitting
    And I return to the community page
    Then my previous input should be restored if autosave is enabled
