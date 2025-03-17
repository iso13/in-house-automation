@shareAnonymously @wip
Feature: Share Anonymously
    As an Insider
    I should be able to share anonymously
    So I can share without revealing my identity

    Background:
        Given I launch in-house
        And the user has selected a workspace

    Scenario: Successfully share anonymously
        When the user selects the "insider" relationship type
        And the user submits a single word identifier
        Then the user acknowledges the confirmation
        And should see the "rate, post, top mink" dashboard
