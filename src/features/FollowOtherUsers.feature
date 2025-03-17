@followOtherUsers @wip
Feature: Follow Other Users

As a user, I want to follow other users so that I can see their posts and polls in my feed.

Scenario: User follows another user
Given I am viewing a user’s profile
When I click the “Follow” button
Then I should see the user in my following list

Scenario: User unfollows another user
Given I am following a user
When I click the “Unfollow” button
Then I should no longer see their updates