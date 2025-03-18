@directMessaging @wip
Feature: Direct Messaging

As a user, I want to send private messages to other users so that I can have one-on-one conversations.

Scenario: User sends a direct message
Given I am on a user’s profile
When I click on “Send Message”
And I type and send a message
Then the recipient should receive the message

Scenario: User receives a message
Given I have received a direct message
When I open my inbox
Then I should see the message in my conversation list