@resetPassword @wip
Feature: Reset Password

As a user, I want to reset my password so that I can regain access to my account if I forget it.

Scenario: User requests a password reset
Given I am on the login page
When I click on the “Forgot Password” link
And I enter my registered email
Then I should receive a password reset email

Scenario: User resets password successfully
Given I have received a password reset email
When I follow the reset link
And I enter a new password
Then my password should be updated successfully
