@searchPolls @wip
Feature: Search Polls

As a user, I want to search for a specific poll so that I can quickly find relevant discussions.

Scenario: User searches for a poll
Given I am on the polls page
When I enter a keyword in the search bar
And I submit the search
Then I should see a list of polls matching my search

Scenario: User searches for a non-existent poll
Given I am on the polls page
When I enter a keyword that does not match any poll
Then I should see a message indicating no results found