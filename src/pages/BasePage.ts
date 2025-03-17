// src/support/BasePage.ts
import { Page } from 'playwright';

export class BasePage {
  protected page: Page;

  constructor(page: Page) {
    if (!page) {
      throw new Error('Page is not initialized');
    }
    this.page = page;
  }

  // Common navigation and interaction methods
  async navigate(url: string): Promise<void> {
    await this.page.goto(url);
  }

  async click(selector: string): Promise<void> {
    await this.page.click(selector);
  }

  async fill(selector: string, text: string): Promise<void> {
    await this.page.fill(selector, text);
  }

  async isVisible(selector: string): Promise<boolean> {
    const element = await this.page.$(selector);
    return element !== null && await element.isVisible();
  }

  async getText(selector: string): Promise<string> {
    return await this.page.textContent(selector) || '';
  }

  async getByRole(selector: string): Promise<string> {
    return await this.page.textContent(selector) || '';
  }
  // You can add more common methods here
}