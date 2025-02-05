@wip
Feature: Delete House
    As an admin
    I need to delete a House
    Because its no longer relevant

    Scenario: Delete an existing house
        Given there is an existing house
        When I delete the house
        Then the should not be visible

    Scenario: Delete a house that doesn't exist