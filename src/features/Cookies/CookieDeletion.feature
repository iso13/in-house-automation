@wip
Feature: Cookie Deletion

    Scenario: Validate cookies are deleted on clearing browser data
        Given I launch in-house
        And cookies are set
        When I clear browser cookies
        Then no cookies should be present