# Demo Scenario - Interactive Walkthrough

This document shows a step-by-step scenario of using the Sublime To Do application.

## Scenario: Sarah's First Week with Sublime To Do

### Day 1 - Monday Morning (First Time User)

**Step 1: Launch Application**
```
Application opens → Shows Login screen with gradient background
```

**Step 2: Create Account**
```
User: Clicks "Don't have an account? Sign up"
App:  Switches to signup form

User: Enters:
      - Display Name: "Sarah Johnson"
      - Email: "[email protected]"
      - Password: "********"

User: Clicks "Sign Up"
App:  Shows loading indicator (1 second)
      Creates user account
      Saves session
      Transitions to main interface
```

**Step 3: First View of Main Interface**
```
┌────────────────────────┬──────────────────────────────────────────┐
│ Sublime To Do      👤  │ November 14, 2025                        │
│                        │ No todos yet                              │
│ ➕ New Day Log         │                                          │
│ 🔍 Search...           │ [Empty state with icon]                  │
│                        │                                          │
│ │ November 14, 2025    │ ➕ Add a new todo...                     │
│ │ Today                │                                          │
│ │ 0/0                  │                                          │
│                        │                                          │
│ 👤 Sarah Johnson       │                                          │
│    [email protected]    │                                          │
└────────────────────────┴──────────────────────────────────────────┘
```

**Step 4: Add First Todo**
```
User: Clicks in "Add a new todo..." field
      Types: "Review morning emails"
      Presses Enter

App:  Creates todo instantly
      Updates UI
      Updates sidebar count to "1"
```

**Result:**
```
┌────────────────────────┬──────────────────────────────────────────┐
│ Sublime To Do      👤  │ November 14, 2025                        │
│                        │ ✓ 0 of 1 completed                       │
│ ➕ New Day Log         │                                          │
│ 🔍 Search...           │ ➕ Add a new todo...                     │
│                        │                                          │
│ │ November 14, 2025    │ ○ Review morning emails                  │
│ │ Today                │                                          │
│ │ 0/1               █  │                                          │
│                        │                                          │
│ 👤 Sarah Johnson       │                                          │
└────────────────────────┴──────────────────────────────────────────┘
```

**Step 5: Add More Todos**
```
User adds:
- "Prepare presentation for client meeting"
- "Call vendor about shipment delay"
- "Update project timeline"
- "Team standup at 10 AM"
```

**Result:**
```
│ November 14, 2025        │ November 14, 2025                        │
│ Today                    │ ✓ 0 of 5 completed                       │
│ 0/5                 ████ │                                          │
│                          │ ○ Review morning emails                  │
│                          │ ○ Prepare presentation for client meeting│
│                          │ ○ Call vendor about shipment delay       │
│                          │ ○ Update project timeline                │
│                          │ ○ Team standup at 10 AM                  │
```

### Day 1 - Monday 9:30 AM

**Step 6: Complete First Todo**
```
User: Clicks circle next to "Review morning emails"

App:  Toggles completion
      Circle → Green checkmark ✓
      Text → Gray with strikethrough
      Adds timestamp
      Updates progress: "1 of 5 completed"
      Updates sidebar progress bar
```

**Result:**
```
│ November 14, 2025        │ November 14, 2025                        │
│ Today                    │ ✓ 1 of 5 completed                       │
│ 1/5                   █  │                                          │
│                          │ ✓ Review morning emails                  │
│                          │    Completed just now                    │
│                          │ ○ Prepare presentation for client meeting│
│                          │ ○ Call vendor about shipment delay       │
│                          │ ○ Update project timeline                │
│                          │ ○ Team standup at 10 AM                  │
```

### Day 1 - Monday 11:00 AM

**Step 7: Add Details to a Todo**
```
User: Clicks on "Prepare presentation for client meeting"

App:  Opens Edit Todo sheet
```

**Edit Dialog:**
```
┌───────────────────────────────────────────────────┐
│ Edit Todo                                     ✖   │
├───────────────────────────────────────────────────┤
│ Title                                             │
│ ┌───────────────────────────────────────────────┐│
│ │ Prepare presentation for client meeting      ││
│ └───────────────────────────────────────────────┘│
│                                                   │
│ Description (optional)                            │
│ ┌───────────────────────────────────────────────┐│
│ │ |                                             ││ <- Cursor here
│ └───────────────────────────────────────────────┘│
└───────────────────────────────────────────────────┘
```

```
User: Types in description:
      "Include Q4 results, new product roadmap, and budget proposal.
       Meeting at 2 PM in Conference Room B."

User: Clicks "Save"

App:  Updates todo
      Closes sheet
      Shows description under todo title
```

**Result:**
```
│ ○ Prepare presentation for client meeting                           │
│    Include Q4 results, new product roadmap, and budget proposal...  │
```

### Day 1 - Monday 5:00 PM

**Step 8: End of Day Progress**
```
User has completed 3 out of 5 todos:
✓ Review morning emails (completed 7 hours ago)
✓ Team standup at 10 AM (completed 6 hours ago)
✓ Call vendor about shipment delay (completed 2 hours ago)
○ Prepare presentation for client meeting
○ Update project timeline
```

**Sidebar shows:**
```
│ November 14, 2025        │
│ Today                    │
│ 3/5                ███   │
```

### Day 2 - Tuesday Morning

**Step 9: Create New Day Log**
```
User: Clicks "➕ New Day Log"

App:  Opens New Day Log sheet with today's date pre-selected
```

```
User: Enters title: "Tuesday Work Tasks"
      Keeps date as Nov 15, 2025
      Clicks "Create Day Log"

App:  Creates new day log
      Adds to top of sidebar
      Automatically selects it
      Shows empty state
```

**Sidebar now shows:**
```
│ │ Tuesday Work Tasks       │
│ │ Today                    │
│ │ 0/0                      │
│ │                          │
│ │ November 14, 2025        │
│ │ Yesterday                │
│ │ 3/5                ███   │
```

**Step 10: Add Todos to New Day**
```
User adds todos for Tuesday:
- "Deliver client presentation"
- "Review code PRs"
- "1-on-1 with manager"
- "Finalize Q4 budget"
```

### Day 3 - Wednesday

**Step 11: Search Functionality**
```
User: Types "presentation" in search box

App:  Filters day logs in real-time
      Shows matching results
```

**Search Results:**
```
│ 🔍 presentation          │  Search Results                          │
│                          │                                          │
│ Tuesday Work Tasks       │  ✓ Deliver client presentation           │
│ Today                    │     Completed yesterday                  │
│ 1/1                      │     From: Tuesday Work Tasks             │
│                          │                                          │
│ November 14, 2025        │  ○ Prepare presentation for client...    │
│ 2 days ago               │     Include Q4 results...                │
│ 1/1                      │     From: November 14, 2025              │
```

### Day 4 - One Week Later

**Step 12: Historical View**
```
Sidebar shows all past week's day logs:
```

```
│ │ Friday Planning              │
│ │ Today                        │
│ │ 2/6                     ██   │
│ │                              │
│ │ Thursday Tasks               │
│ │ Yesterday                    │
│ │ 5/5                    █████ │
│ │                              │
│ │ Wednesday Work               │
│ │ Nov 20, 2025                 │
│ │ 4/7                     ███  │
│ │                              │
│ │ Tuesday Work Tasks           │
│ │ Nov 19, 2025                 │
│ │ 4/4                    █████ │
│ │                              │
│ │ November 14, 2025            │
│ │ Nov 14, 2025                 │
│ │ 5/5                    █████ │
```

### Advanced Usage Examples

**Example 1: Editing Todo**
```
User clicks on any todo → Edit sheet opens
User can:
- Modify title
- Add/edit description
- Delete todo
- Save changes
```

**Example 2: Deleting Todo**
```
Method 1 - Hover:
  User hovers over todo → Delete icon (🗑️) appears → Click to delete

Method 2 - Edit Sheet:
  User clicks todo → Edit sheet opens → Click "Delete" button
```

**Example 3: Managing Old Day Logs**
```
User can:
- Click any past day log to view it
- Add new todos to past days
- Complete past todos
- Search across all days
```

**Example 4: Creating Day Log for Future**
```
User: Clicks "New Day Log"
      Selects future date (e.g., next Monday)
      Enters title: "Next Week Planning"
      Adds todos in advance
```

## Data Persistence Example

**User closes app:**
```
App saves:
- User session (stays logged in)
- All day logs
- All todos
- Completion status
- Timestamps
```

**User reopens app:**
```
App loads:
- Auto-login (no need to re-enter credentials)
- All data intact
- Scrolls to today's log
- Everything exactly as left
```

## User Experience Highlights

### Visual Feedback
- ✓ Smooth animations when completing todos
- ✓ Progress bars update in real-time
- ✓ Hover effects provide visual cues
- ✓ Color changes indicate state

### Smart Features
- ✓ Auto-creates today's log on first launch
- ✓ "Today" and "Yesterday" smart labels
- ✓ Time-ago for completion ("2 hours ago")
- ✓ Auto-saves everything
- ✓ Instant search results

### Productivity Features
- ✓ Quick-add todos (just type and Enter)
- ✓ Click anywhere on todo to edit
- ✓ Visual progress tracking
- ✓ Organized by day for easy reference
- ✓ Search across all todos

## Statistics After One Week of Use

**Sarah's Week:**
```
Total Day Logs Created:    7
Total Todos Created:      35
Total Todos Completed:    28
Completion Rate:          80%
Average Todos/Day:         5
Most Productive Day:      Thursday (5/5 = 100%)
```

**Dashboard View (Potential):**
```
Week of Nov 14-20, 2025

Mon  ███░░ 3/5
Tue  █████ 4/4
Wed  ███░░ 4/7
Thu  █████ 5/5
Fri  ██░░░ 2/6
Sat  ████░ 4/5
Sun  ███░░ 6/8

Total: 28/40 (70% completion)
```

---

**This demonstrates a realistic usage pattern of the Sublime To Do application over the course of a week!**
