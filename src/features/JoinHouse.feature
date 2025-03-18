@joinHouse @wip
Feature: Join House

As a user, I want to join a house so that I can be a part of a community.

Scenario: User joins a house
Given I am on a house page
When I click the join button
Then I should see a confirmation message

Scenario: User requests to join a private house
Given I am on a private house page
When I click the join button
Then I should see a pending approval message