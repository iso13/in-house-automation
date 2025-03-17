@deletePoll @wip
Feature: Delete Poll

As a poll creator, I want to delete a poll so that I can remove outdated or incorrect polls.

Scenario: User deletes a poll
Given I am viewing my poll
When I click on the delete button
And I confirm deletion
Then the poll should be removed from the list

Scenario: User cancels poll deletion
Given I am viewing my poll
When I click on the delete button
And I cancel the deletion
Then the poll should remain visible