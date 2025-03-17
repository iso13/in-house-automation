import { Given } from '@cucumber/cucumber';
import { CustomWorld } from '../support/world';
import { environments } from '../support/environments';

Given('I launch in-house', async function (this: CustomWorld) {
  const envKey = process.env.ENV as keyof typeof environments || 'qa';
  const baseURL = environments[envKey];
  const button = this.page?.getByRole('button', { name: 'got it' });
  
  await this.page?.goto(baseURL);
  await this.page?.waitForTimeout(2000);
  await this.page?.getByRole('button', { name: 'got it' }).click();
});