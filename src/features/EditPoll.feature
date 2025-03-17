@editPoll @wip
Feature: Edit Poll
As a poll creator, I want to edit a poll so that I can correct mistakes or update options.

Scenario: User edits an existing poll
Given I am viewing my poll
When I click on the edit button
And I update the poll details
And I save the changes
Then the poll should be updated successfully

Scenario: User cancels poll editing
Given I am viewing my poll
When I click on the edit button
And I make changes but click cancel
Then the poll should remain unchanged