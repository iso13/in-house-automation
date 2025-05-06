Feature: Rate Planet Tag
  As a user
  I want to rate planet tag
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the tag page

  Scenario: Successfully rate planet tag
    When I enter valid information to rate planet tag
    And I submit the form
    Then I should see a confirmation message
    And the tag should be saved

  Scenario: rate planet tag using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the tag should be saved without error

  Scenario: Attempt to rate planet tag with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to rate planet tag with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the tag page

  Scenario: Navigate away and return to resume rate planet tag
    When I start to rate planet tag
    And I leave the page before submitting
    And I return to the tag page
    Then my previous input should be restored if autosave is enabled
