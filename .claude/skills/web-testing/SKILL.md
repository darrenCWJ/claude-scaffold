---
name: web-testing
description: Verify web deliverables in a real browser using Playwright — rendering, interaction, console errors, responsive layout, E2E flows. Use whenever the deliverable is a website, web app, HTML page, dashboard, or artifact that renders in a browser, and before claiming any UI "works", "renders", or "looks right". Static inspection of HTML/JSX is NOT verification of a web deliverable.
---

# Web testing (Playwright)

"The code looks right" and "the DOM contains the element" are not evidence for web work — only a real browser rendering, executing JS, and being interacted with is. Playwright is the default tool: headless, scriptable, multi-browser.

## Setup (once per environment)

    npm init -y && npm i -D playwright && npx playwright install chromium --with-deps

Python alternative: `pip install playwright && playwright install chromium`.
In Claude Code, the MCP server option gives interactive browser control instead of scripts:

    claude mcp add playwright -- npx @playwright/mcp@latest

Prefer the MCP for exploratory checking; prefer scripts for repeatable verification (scripts become the regression suite).

## The minimum gate for ANY web deliverable

Run all five — they catch different failures:

1. **It loads.** Navigate; assert HTTP 200 and no uncaught page errors. Capture `page.on('console')` and `page.on('pageerror')` — a page can render while the console screams.
2. **It renders.** Full-page screenshot; LOOK at it (read the image). Blank page, overlapping text, and unstyled HTML all "pass" DOM assertions.
3. **It works.** Exercise the core interaction(s): click the button, submit the form, apply the filter — assert the observable result, not the absence of an exception.
4. **It survives sizes.** Screenshot at ≥2 viewports (e.g. 1280×800 and 390×844). Mobile breakage is the most common silently-shipped defect.
5. **It fails visibly.** One negative test: invalid input, empty state, or missing data — the page should degrade, not white-screen.

## Script skeleton (Node)

    const { chromium } = require('playwright');
    (async () => {
      const browser = await chromium.launch();
      const page = await browser.newPage({ viewport: { width: 1280, height: 800 } });
      const errors = [];
      page.on('pageerror', e => errors.push(e.message));
      page.on('console', m => m.type() === 'error' && errors.push(m.text()));
      await page.goto('http://localhost:8000', { waitUntil: 'networkidle' });
      await page.screenshot({ path: 'shot-desktop.png', fullPage: true });
      // interactions + assertions here, e.g.:
      // await page.click('text=Submit'); await page.waitForSelector('.result');
      if (errors.length) { console.error('CONSOLE/PAGE ERRORS:', errors); process.exit(1); }
      await browser.close(); console.log('PASS');
    })();

Serve local files first (`python3 -m http.server 8000`) — `file://` skips CORS/fetch behavior that will differ in production.

## Practices

- **Screenshots are evidence** (verification skill): save them with the verification record; read them, don't just save them.
- Prefer role/text selectors (`getByRole`, `text=`) over brittle CSS chains; they test what the user experiences.
- Waits: use `waitForSelector`/`networkidle`, never fixed sleeps — sleeps are flaky AND slow.
- E2E flows that matter get saved as `tests/e2e/*.spec.js` and run with `npx playwright test` — they join the project's verification path (orient skill).
- No browser available in the environment? Say so explicitly and downgrade the claim: "HTML validates and parses; NOT verified in a browser" — never let a rendering claim ride on static checks.
