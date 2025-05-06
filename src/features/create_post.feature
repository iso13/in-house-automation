Feature: Create Post
  As a user
  I want to create post
  So that I can interact with the system meaningfully

  Background:
    Given I am logged in
    And I am on the post page

  Scenario: Successfully create post
    When I enter valid information to create post
    And I submit the form
    Then I should see a confirmation message
    And the post should be saved

  Scenario: create post using maximum input values
    When I fill in all fields with their maximum allowed values
    And I submit the form
    Then the system should accept the input
    And the post should be saved without error

  Scenario: Attempt to create post with missing required fields
    When I submit the form with incomplete information
    Then I should see validation messages for required fields

  Scenario: Attempt to create post with invalid input types
    When I provide invalid data formats
    And I submit the form
    Then the system should reject the input
    And I should remain on the post page

  Scenario: Navigate away and return to resume create post
    When I start to create post
    And I leave the page before submitting
    And I return to the post page
    Then my previous input should be restored if autosave is enabled
