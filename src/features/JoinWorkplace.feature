@joinWorkplace
Feature: Join Workplace
    As a user
    I should be able to join a workplace
    So I can view the workplace

    Background:
        Given I launch in-house
        And the user has selected a workspace
    
    Scenario: Successfully join as an insider
        When the user selects the "insider" relationship type
        And the user submits a single word identifier
        Then the user acknowledges the confirmation
        And should see the "rate, post, top mink" dashboard

    Scenario: Successfully join as a leadership
        When the user selects the "leadership" relationship type
        Then should see the "rate" dashboard

    Scenario: Successfully join as a public
        When the user selects the "public" relationship type
        Then should see the "rate" dashboard