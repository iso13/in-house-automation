import { When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';

When('I search for the community', async function () {
    await this.page.getByPlaceholder('find your workplace /').fill('Gap');
    await this.page.getByRole('button', { name: 'Gap Inc.' }).click();
});

Then('I should be able to see the community content', async function () {
    const heading = this.page.getByRole("heading", { name: "choose your relationship" });
    await expect(heading).toBeVisible();
});

When('I search for a community that does not exist', async function () {
    await this.page.getByPlaceholder("find your workplace /").fill("NonExistentCommunity");
    //await this.page.keyboard.press("Enter");
});

Then('I should be notified that the community is not available', async function () {
    const errorMessage = this.page.locator("text=No results found");
    await expect(errorMessage).toHaveText("No results found");
});