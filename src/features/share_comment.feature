Feature: Share Comment
  As a user
  I want to share comment
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the comment page

  Scenario: Successfully share comment
    When I enter valid information to share comment
    And I submit the form
    Then I should see a confirmation message
    And the comment should be saved

  Scenario: share comment using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the comment should be saved without error

  Scenario: Attempt to share comment with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to share comment with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the comment page

  Scenario: Navigate away and return to resume share comment
    When I start to share comment
    And I leave the page before submitting
    And I return to the comment page
    Then my previous input should be restored if autosave is enabled
