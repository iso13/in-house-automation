@leaveHouse @wip
Feature: Leave House

As a user, I want to leave a house so that I can exit a community I no longer want to be part of.

Scenario: User leaves a house
Given I am a member of a house
When I click the “Leave House” button
And I confirm my decision
Then I should no longer be a member of the house

Scenario: User is prompted before leaving a house
Given I am a member of a house
When I click the “Leave House” button
Then I should see a confirmation prompt before leaving