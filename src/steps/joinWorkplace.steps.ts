import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import { CustomWorld } from '../support/world';
/**
 * Selects a workspace.
 */
Given('the user has selected a workspace', async function () {
  const workspace = this.page.getByRole('heading', { name: 'dunder mifflin (DEMO)' });
  await expect(workspace).toBeVisible();
  await workspace.click();
});

/**
 * Selects a relationship type dynamically.
 */
When('the user selects the {string} relationship type', async function (relationshipType) {
  const button = this.page.getByRole('button', { name: `${relationshipType} Right arrow Icon` });
  await expect(button).toBeVisible();
  await button.click();
});

/**
 * Submits a single-word identifier.
 */
When('the user submits a single word identifier', async function () {
  const inputField = this.page.getByPlaceholder('one word / no spaces');
  await expect(inputField).toBeVisible();
  await inputField.fill('dwight');
  await this.page.getByRole('button', { name: 'enter Right arrow Icon' }).click();
});

/**
 * Confirms the user acknowledgment.
 */
Then('the user acknowledges the confirmation', async function () {
  const confirmationMessage = this.page.locator('article').filter({ hasText: 'insider!you are safe' }).locator('path');
  await expect(confirmationMessage).toBeVisible();
  await this.page.getByRole('button', { name: 'got it' }).click();
});

/**
 * Validates the correct dashboard is displayed.
 */
Then('should see the {string} dashboard', async function (dashboardType: string) {
  // Define a strict mapping for valid dashboard types
  const dashboards: Record<string, string[]> = {
    "rate": ["rate"],
    "rate, post, top mink": ["rate", "post", "top mink"],
  };

  // Ensure the dashboard type is valid
  if (!dashboards[dashboardType]) {
    throw new Error(`Unknown dashboard type: ${dashboardType}`);
  }

  // Verify that all expected elements are visible
  for (const name of dashboards[dashboardType]) {
    await expect(this.page.getByRole('button', { name })).toBeVisible();
  }
});