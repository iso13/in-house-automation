Feature: Sort Post
  As a user
  I want to sort post
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the post page

  Scenario: Successfully sort post
    When I enter valid information to sort post
    And I submit the form
    Then I should see a confirmation message
    And the post should be saved

  Scenario: sort post using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the post should be saved without error

  Scenario: Attempt to sort post with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to sort post with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the post page

  Scenario: Navigate away and return to resume sort post
    When I start to sort post
    And I leave the page before submitting
    And I return to the post page
    Then my previous input should be restored if autosave is enabled
