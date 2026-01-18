---
description: Browser automation CLI optimized for AI agents using npx agent-browser
allowed-tools: Bash(npx agent-browser:*)
---

# agent-browser

Browser automation CLI optimized for AI agents. Use `npx agent-browser` for all commands.

## When to Use

- Testing websites and web applications
- Verifying UI changes after code modifications
- Checking for console errors and page issues
- Taking screenshots for documentation or debugging
- Automating form submissions and user flows

## Core Workflow

**Always follow this pattern: snapshot → identify refs → act → snapshot again**

```bash
npx agent-browser open http://localhost:4321    # Navigate
npx agent-browser snapshot -i                    # Get interactive elements with refs
npx agent-browser click @e2                      # Act using ref from snapshot
npx agent-browser snapshot -i                    # Get updated state
```

Refs (e.g., `@e1`, `@e2`) are stable element identifiers from snapshots. Always use refs over CSS selectors when possible.

**Important:** Always use `snapshot -i` (interactive elements only) by default. This dramatically reduces output size by filtering to just buttons, links, inputs, and other actionable elements - which is usually all you need for browser automation. Only use full `snapshot` when you need to verify text content or page structure.

## Essential Commands

### Navigation
```bash
npx agent-browser open <url>        # Navigate to URL
npx agent-browser back              # Go back
npx agent-browser forward           # Go forward
npx agent-browser reload            # Reload page
npx agent-browser close             # Close browser
```

### Page Analysis
```bash
npx agent-browser snapshot -i       # Interactive elements only (preferred default)
npx agent-browser snapshot          # Full accessibility tree (when you need all content)
npx agent-browser snapshot -i -c    # Interactive + compact (minimal output)
npx agent-browser snapshot -d 3     # Limit tree depth
npx agent-browser snapshot -s "#main"  # Scope to CSS selector
npx agent-browser errors            # Check for JS errors
npx agent-browser console           # View console logs
```

### Interaction
```bash
npx agent-browser click @e1         # Click element
npx agent-browser dblclick @e1      # Double-click element
npx agent-browser fill @e2 "text"   # Clear field and type
npx agent-browser type @e2 "text"   # Type without clearing
npx agent-browser press Enter       # Press key
npx agent-browser press Control+a   # Key combination
npx agent-browser hover @e3         # Hover element
npx agent-browser focus @e1         # Focus element
npx agent-browser check @e1         # Check checkbox
npx agent-browser uncheck @e1       # Uncheck checkbox
npx agent-browser select @e1 "value"  # Select dropdown option
npx agent-browser scroll down 500   # Scroll page
npx agent-browser scrollintoview @e1  # Scroll element into view
npx agent-browser drag @e1 @e2      # Drag and drop
npx agent-browser upload @e1 file.pdf  # Upload file
```

### Capture
```bash
npx agent-browser screenshot                    # Screenshot to stdout
npx agent-browser screenshot /path/to/file.png  # Save to specific path
npx agent-browser screenshot --full             # Full page screenshot
npx agent-browser pdf /path/to/file.pdf         # Save as PDF
```

### Video Recording
```bash
npx agent-browser record start ./demo.webm      # Start recording
npx agent-browser record stop                   # Stop and save
npx agent-browser record restart ./take2.webm   # Stop current, start new
```

### Get Information
```bash
npx agent-browser get text @e1      # Get element text
npx agent-browser get html @e1      # Get inner HTML
npx agent-browser get value @e2     # Get input value
npx agent-browser get attr @e1 href # Get attribute value
npx agent-browser get url           # Get current URL
npx agent-browser get title         # Get page title
npx agent-browser get count ".item" # Count matching elements
npx agent-browser get box @e1       # Get bounding box
```

### Check State
```bash
npx agent-browser is visible @e1    # Check visibility
npx agent-browser is enabled @e1    # Check if enabled
npx agent-browser is checked @e1    # Check checkbox state
```

### Wait Commands
```bash
npx agent-browser wait @e1                      # Wait for element
npx agent-browser wait 2000                     # Wait milliseconds
npx agent-browser wait --text "Success"         # Wait for text
npx agent-browser wait --url "**/dashboard"     # Wait for URL pattern
npx agent-browser wait --load networkidle       # Wait for network idle
npx agent-browser wait --fn "window.ready"      # Wait for JS condition
```

### Semantic Locators (Alternative to Refs)
```bash
npx agent-browser find role button click --name "Submit"  # Find by ARIA role
npx agent-browser find text "Sign In" click               # Find by visible text
npx agent-browser find label "Email" fill "user@test.com" # Find by label
npx agent-browser find first ".item" click                # First match
npx agent-browser find nth 2 "a" text                     # Nth element
```

### Sessions & State
```bash
npx agent-browser --session test1 open site-a.com  # Named session
npx agent-browser --session test2 open site-b.com  # Another session
npx agent-browser session list                      # List sessions
npx agent-browser state save auth.json              # Save browser state
npx agent-browser state load auth.json              # Load browser state
```

### Cookies & Storage
```bash
npx agent-browser cookies                  # Get all cookies
npx agent-browser cookies set name value   # Set cookie
npx agent-browser cookies clear            # Clear cookies
npx agent-browser storage local            # Get localStorage
npx agent-browser storage local key        # Get specific key
npx agent-browser storage local set k v    # Set value
npx agent-browser storage local clear      # Clear all
```

### Network
```bash
npx agent-browser network route <url>              # Intercept requests
npx agent-browser network route <url> --abort      # Block requests
npx agent-browser network route <url> --body '{}'  # Mock response
npx agent-browser network unroute [url]            # Remove routes
npx agent-browser network requests                 # View tracked requests
npx agent-browser network requests --filter api    # Filter requests
```

### Tabs & Windows
```bash
npx agent-browser tab              # List tabs
npx agent-browser tab new [url]    # New tab
npx agent-browser tab 2            # Switch to tab
npx agent-browser tab close        # Close tab
npx agent-browser window new       # New window
```

### Frames & Dialogs
```bash
npx agent-browser frame "#iframe"       # Switch to iframe
npx agent-browser frame main            # Back to main frame
npx agent-browser dialog accept [text]  # Accept dialog
npx agent-browser dialog dismiss        # Dismiss dialog
```

### JavaScript
```bash
npx agent-browser eval "document.title"  # Execute JavaScript
```

### Browser Settings
```bash
npx agent-browser set viewport 1920 1080      # Viewport size
npx agent-browser set device "iPhone 14"      # Device emulation
npx agent-browser set geo 37.7749 -122.4194   # Geolocation
npx agent-browser set offline on              # Offline mode
npx agent-browser set headers '{"X-Key":"v"}' # HTTP headers
npx agent-browser set credentials user pass   # Basic auth
npx agent-browser set media dark              # Color scheme emulation
```

## Common Testing Workflows

### Test a Local Dev Server
```bash
npx agent-browser open http://localhost:4321
npx agent-browser snapshot -i       # Get interactive elements
npx agent-browser errors            # Check for JS errors
npx agent-browser screenshot /tmp/homepage.png
```

### Test Form Submission
```bash
npx agent-browser snapshot -i       # Get interactive elements
npx agent-browser fill @e3 "test@example.com"
npx agent-browser fill @e4 "message"
npx agent-browser click @e5         # Submit button
npx agent-browser wait --load networkidle
npx agent-browser snapshot -i       # Check result
```

### Authentication with Saved State
```bash
# Initial login
npx agent-browser open https://app.example.com/login
npx agent-browser fill @e1 "username"
npx agent-browser fill @e2 "password"
npx agent-browser click @e3
npx agent-browser wait --url "**/dashboard"
npx agent-browser state save auth.json

# Reuse saved session
npx agent-browser state load auth.json
npx agent-browser open https://app.example.com/dashboard
```

## Snapshot Output Format

```
- document:
  - button "Toggle theme" [ref=e1]
  - main:
    - heading "Title" [ref=e2] [level=1]
    - link "About" [ref=e3]:
      - /url: /about
    - textbox "Email" [ref=e4]
```

## Debugging

```bash
npx agent-browser open example.com --headed  # Show browser window
npx agent-browser console --clear            # Clear console
npx agent-browser errors --clear             # Clear errors
npx agent-browser highlight @e1              # Highlight element
npx agent-browser trace start                # Start trace
npx agent-browser trace stop trace.zip       # Stop and save trace
npx agent-browser --cdp 9222                 # Connect via DevTools Protocol
```

## JSON Output

Add `--json` flag for machine-readable output:
```bash
npx agent-browser snapshot -i --json
npx agent-browser get text @e1 --json
```

## Troubleshooting

**Browser not installed:**
```bash
npx agent-browser install
```

**Element not found:** Run `snapshot` again - refs change when page updates.
