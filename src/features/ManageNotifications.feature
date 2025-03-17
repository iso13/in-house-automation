@manageNotifications @wip
Feature: Manage Notifications

As a user, I want to manage my notification settings so that I can control when I receive updates.

Scenario: User enables poll notifications
Given I am on the settings page
When I enable notifications for polls
Then I should receive updates when new polls are created

Scenario: User disables poll notifications
Given I am on the settings page
When I disable notifications for polls
Then I should no longer receive updates