@manageProfileSettings @wip
Feature: Manage Profile Settings

As a user, I want to update my profile settings so that I can keep my information up to date.

Scenario: User updates profile information
Given I am logged in
When I navigate to my profile settings
And I update my information
And I save the changes
Then my profile should be updated successfully

Scenario: User changes password
Given I am logged in
When I navigate to the change password section
And I enter my current and new password
Then my password should be changed successfully