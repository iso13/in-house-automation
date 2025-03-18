import { setWorldConstructor, World, IWorldOptions } from '@cucumber/cucumber';
import { Browser, BrowserContext, Page, chromium } from 'playwright';;

export interface CustomWorld extends World {
  browser?: Browser;
  context?: BrowserContext;
  page?: Page;
  scenarioName: string;
  featureName: string;
  pickle: any;
  a11yResults?: any;
  data: Record<string, any>; // General data storage
  
  // Browser operations
  launchBrowser(): Promise<void>;
  navigate(url: string): Promise<void>;
  click(selector: string): Promise<void>;
  fill(selector: string, value: string): Promise<void>;
  isVisible(selector: string): Promise<boolean>;
  getText(selector: string): Promise<string>;
}

class PlaywrightWorld extends World implements CustomWorld {
  browser?: Browser;
  context?: BrowserContext;
  page?: Page;
  scenarioName: string;
  featureName: string;
  pickle: any;
  a11yResults?: any;
  data: Record<string, any> = {};
  
  constructor(options: IWorldOptions) {
    super(options);
    this.scenarioName = '';
    this.featureName = '';
  }

  async launchBrowser(): Promise<void> {
    try {
      this.browser = await chromium.launch({ headless: true });
      this.context = await this.browser.newContext();
      this.page = await this.context.newPage();
      console.log('✅ Browser launched successfully, page created');
    } catch (error) {
      console.error('❌ Failed to launch browser:', error);
      throw error;
    }
  }

  // Helper method to ensure page exists
  private ensurePage(): Page {
    if (!this.page) {
      throw new Error('Page is not initialized');
    }
    return this.page;
  }

  // Navigation
  async navigate(url: string): Promise<void> {
    await this.ensurePage().goto(url);
  }

  // Interactions
  async click(selector: string): Promise<void> {
    await this.ensurePage().click(selector);
  }

  async fill(selector: string, value: string): Promise<void> {
    await this.ensurePage().fill(selector, value);
  }

  // Assertions
  async isVisible(selector: string): Promise<boolean> {
    const element = await this.ensurePage().$(selector);
    return element !== null && await element.isVisible();
  }

  async getText(selector: string): Promise<string> {
    return await this.ensurePage().textContent(selector) || '';
  }
}

setWorldConstructor(PlaywrightWorld);