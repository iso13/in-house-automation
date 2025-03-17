import { When, Then } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';

When('I select the rate for {string}', async function (this: CustomWorld, rateLabel: string) {
  if (!this.page) throw new Error('Page is not defined');
  
  const rateButton = this.page.locator(`button:has-text("${rateLabel}")`);
  await rateButton.click();
});

Then('I should be able to rate', async function (this: CustomWorld) {
  await this.page?.locator('button:nth-child(6)').click();
  await this.page?.locator('div').filter({ hasText: /^dunder mifflin \(DEMO\)$/ }).getByRole('button').click();
});

  