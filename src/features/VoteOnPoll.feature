@voteOnPoll @wip
Feature: Vote on Poll

As a user, I want to vote on a poll so that I can express my opinion.

Scenario: User votes on a poll
Given I am viewing a poll
When I select an option
And I submit my vote
Then my vote should be recorded successfully

Scenario: User changes vote
Given I have already voted on a poll
When I change my selection and resubmit
Then my new vote should be recorded