@sharePoll @wip
Feature: Share Poll

As a user, I want to share a poll so that I can invite others to participate.

Scenario: User shares a poll via link
Given I am viewing a poll
When I click on the share button
And I copy the poll link
Then I should be able to share it with others

Scenario: User shares a poll via social media
Given I am viewing a poll
When I click on the share button
And I select a social media platform
Then the poll should be shared successfully