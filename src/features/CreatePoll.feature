@createPoll @wip
Feature: Create Poll
    As a user, I want to create a new poll so that I can ask questions to the community.

    Scenario: User creates a new poll
        Given I am on the create poll page
        When I enter a question and options
        And I submit the poll
        Then the poll should be created successfully
    Scenario: User cancels poll creation
        Given I am on the create poll page
        When I enter a question and options
        And I click cancel
        Then the poll should not be created