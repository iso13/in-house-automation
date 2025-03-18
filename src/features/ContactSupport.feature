@contactSupport @wip
Feature: Contact Support

As a user, I want to contact support so that I can get help.

Scenario: User fills out and submits the contact form
Given I am on the contact page
When I fill out the contact form
And I submit the form
Then I should see a confirmation message

Scenario: User submits an incomplete contact form
Given I am on the contact page
When I submit the form without filling all required fields
Then I should see an error message