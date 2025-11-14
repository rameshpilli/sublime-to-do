# Visual Walkthrough - Sublime To Do

This document shows what the application looks like when running.

## 1. Login Screen (First Launch)

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                       │
│                     [Purple/Blue Gradient Background]                │
│                                                                       │
│                                                                       │
│                         ✓  (Large checkmark icon)                    │
│                                                                       │
│                         Sublime To Do                                │
│                                                                       │
│                         Welcome back                                 │
│                                                                       │
│                                                                       │
│         ┌───────────────────────────────────────────────┐           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │ ✉  Email                                │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │ 🔒 Password                             │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │          Log In                         │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │     Don't have an account? Sign up            │           │
│         │                                                │           │
│         └───────────────────────────────────────────────┘           │
│                                                                       │
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## 2. Signup Screen (Click "Sign up")

```
┌─────────────────────────────────────────────────────────────────────┐
│                                                                       │
│                     [Purple/Blue Gradient Background]                │
│                                                                       │
│                         ✓  (Large checkmark icon)                    │
│                                                                       │
│                         Sublime To Do                                │
│                                                                       │
│                      Create your account                             │
│                                                                       │
│         ┌───────────────────────────────────────────────┐           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │ 👤 Display Name                         │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │ ✉  Email                                │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │ 🔒 Password                             │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │  ┌─────────────────────────────────────────┐  │           │
│         │  │          Sign Up                        │  │           │
│         │  └─────────────────────────────────────────┘  │           │
│         │                                                │           │
│         │     Already have an account? Log in           │           │
│         └───────────────────────────────────────────────┘           │
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## 3. Main Interface (After Login) - Split View with Sidebar

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│ SIDEBAR (Left)                 │  MAIN CONTENT (Right)                                 │
├────────────────────────────────┼───────────────────────────────────────────────────────┤
│                                │                                                        │
│ Sublime To Do            👤    │  Today's Tasks                                         │
│                                │  📅 Friday, November 14, 2025                          │
│ ┌────────────────────────────┐ │  ✓ 2 of 5 completed                                   │
│ │ ➕ New Day Log             │ │                                                        │
│ └────────────────────────────┘ │  ┌──────────────────────────────────────────────────┐│
│                                │  │ ➕ Add a new todo...                              ││
│ ┌────────────────────────────┐ │  └──────────────────────────────────────────────────┘│
│ │ 🔍 Search logs...          │ │                                                        │
│ └────────────────────────────┘ │  ○ Finish project proposal                            │
│                                │     Complete the Q4 proposal draft                     │
│ │ Today's Tasks              │ │                                                        │
│ │ Today                      │ │  ✓ Review pull requests                               │
│ │ 2/5                     ██ │ │     Completed 2 hours ago                             │
│ │                            │ │                                                        │
│ │                            │ │  ○ Team meeting at 3 PM                               │
│ │ Work Planning              │ │                                                        │
│ │ Yesterday                  │ │  ○ Update documentation                               │
│ │ 4/4                   ████ │ │     Add API reference docs                            │
│ │                            │ │                                                        │
│ │                            │ │  ○ Code review for feature-x                          │
│ │ Personal Goals             │ │                                                        │
│ │ Nov 12, 2025               │ │                                                        │
│ │ 1/3                     █  │ │                                                        │
│ │                            │ │                                                        │
│ │                            │ │                                                        │
│ │ Weekend Tasks              │ │                                                        │
│ │ Nov 10, 2025               │ │                                                        │
│ │ 3/3                   ████ │ │                                                        │
│ │                            │ │                                                        │
│ │                            │ │                                                        │
│ │                            │ │                                                        │
│ │                            │ │                                                        │
│ │                            │ │                                                        │
│ ────────────────────────────── │                                                        │
│ 👤 John Doe                    │                                                        │
│    [email protected]         │                                                        │
│                                │                                                        │
└────────────────────────────────┴────────────────────────────────────────────────────────┘
```

## 4. Hover State on Todo Item

```
│  MAIN CONTENT                                                                           │
│                                                                                         │
│  ┌──────────────────────────────────────────────────────────────────────────────────┐ │
│  │ ○ Update documentation                                               🗑️ Delete  │ │ <- Hover
│  │    Add API reference docs                                                        │ │
│  └──────────────────────────────────────────────────────────────────────────────────┘ │
```

## 5. Create New Day Log Sheet (Modal Dialog)

```
┌─────────────────────────────────────────────────────────────────────┐
│ New Day Log                                                     ✖   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  Title                                                                │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │ e.g., Work Tasks, Personal Goals                                ││
│  └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│  Date                                                                 │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │    November 2025                                                ││
│  │  S   M   T   W   T   F   S                                      ││
│  │                      1   2                                       ││
│  │  3   4   5   6   7   8   9                                      ││
│  │ 10  11  12  13 [14] 15  16                                      ││
│  │ 17  18  19  20  21  22  23                                      ││
│  │ 24  25  26  27  28  29  30                                      ││
│  └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│                                                                       │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │              Create Day Log                                     ││
│  └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## 6. Edit Todo Sheet (Click on any todo)

```
┌─────────────────────────────────────────────────────────────────────┐
│ Edit Todo                                                       ✖   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                       │
│  Title                                                                │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │ Update documentation                                            ││
│  └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│  Description (optional)                                               │
│  ┌─────────────────────────────────────────────────────────────────┐│
│  │ Add API reference docs                                          ││
│  │                                                                  ││
│  │                                                                  ││
│  │                                                                  ││
│  └─────────────────────────────────────────────────────────────────┘│
│                                                                       │
│                                                                       │
│  ┌──────────────────────┐  ┌───────────────────────────────────────┐│
│  │      Delete          │  │          Save                         ││
│  │   (Red button)       │  │      (Blue button)                    ││
│  └──────────────────────┘  └───────────────────────────────────────┘│
│                                                                       │
└─────────────────────────────────────────────────────────────────────┘
```

## 7. Search in Action

```
│ SIDEBAR                        │  MAIN CONTENT                                          │
├────────────────────────────────┼────────────────────────────────────────────────────────┤
│                                │                                                         │
│ Sublime To Do            👤    │  Today's Tasks                                          │
│                                │                                                         │
│ ┌────────────────────────────┐ │                                                         │
│ │ ➕ New Day Log             │ │                                                         │
│ └────────────────────────────┘ │                                                         │
│                                │                                                         │
│ ┌────────────────────────────┐ │  Results for "documentation":                           │
│ │ 🔍 documentation           │ │                                                         │
│ └────────────────────────────┘ │  ○ Update documentation                                │
│                                │     Add API reference docs                              │
│ Today's Tasks                  │     From: Today's Tasks                                 │
│ Today                          │                                                         │
│ 0/1                            │  ✓ Review API documentation                            │
│                                │     Completed 1 day ago                                 │
│ Work Planning                  │     From: Work Planning                                 │
│ Yesterday                      │                                                         │
│ 1/1                            │                                                         │
│                                │                                                         │
└────────────────────────────────┴─────────────────────────────────────────────────────────┘
```

## 8. Empty State (New Day Log with No Todos)

```
│  MAIN CONTENT                                                                           │
│                                                                                         │
│  Weekend Plans                                                                          │
│  📅 Saturday, November 16, 2025                                                         │
│                                                                                         │
│  ┌──────────────────────────────────────────────────────────────────────────────────┐ │
│  │ ➕ Add a new todo...                                                              │ │
│  └──────────────────────────────────────────────────────────────────────────────────┘ │
│                                                                                         │
│                                                                                         │
│                              ✓?                                                         │
│                         (Large icon)                                                    │
│                                                                                         │
│                         No todos yet                                                    │
│                                                                                         │
│               Add your first todo to get started                                        │
│                                                                                         │
│                                                                                         │
└─────────────────────────────────────────────────────────────────────────────────────────┘
```

## 9. User Menu (Click on user icon)

```
│ Sublime To Do            👤    │
│                           │    │
│                           ▼    │
│                      ┌────────┐│
│                      │ Logout ││
│                      └────────┘│
```

## Application Flow

### 1. **First Launch**
   - User sees beautiful gradient login screen
   - Can switch between Login and Signup
   - Forms validate input

### 2. **After Login**
   - Split view appears with sidebar on left
   - Today's day log is auto-created and selected
   - Main content shows empty state or existing todos

### 3. **Creating Todos**
   - Type in "Add a new todo..." field
   - Press Enter to create instantly
   - Todo appears in list immediately

### 4. **Managing Todos**
   - Click checkbox to toggle completion (turns green ✓)
   - Click anywhere on todo row to edit
   - Hover to reveal delete button
   - Completed todos show timestamp

### 5. **Day Logs**
   - Click "New Day Log" to create for any date
   - All day logs appear in sidebar chronologically
   - Progress bars show completion status
   - Click any day log to view its todos

### 6. **Search**
   - Type in search box
   - Results filter in real-time
   - Searches titles and descriptions
   - Shows which day log each result is from

## Color Scheme

**Login Screen:**
- Background: Purple to Blue gradient
- Buttons: White with transparency
- Text: White
- Inputs: White borders with semi-transparent background

**Main Interface:**
- Background: System background (light gray)
- Sidebar: Slightly darker gray
- Selected item: Blue accent with blue left border
- Completed todos: Green checkmark
- Delete button: Red
- Accent color: Blue

## Interactions

**Smooth Animations:**
- Todo completion toggle
- Sidebar selection
- Sheet presentations (slide up)
- Hover effects
- Progress bar updates

**Keyboard Support:**
- Enter to add todo
- Tab navigation
- Escape to close sheets

## Special Features

**Smart Date Labels:**
- Shows "Today" for current day
- Shows "Yesterday" for previous day
- Shows full date for older logs

**Time Ago:**
- "just now" for recent completions
- "X minutes ago"
- "X hours ago"
- "X days ago"

**Progress Tracking:**
- Visual progress bars in sidebar
- Completion count (e.g., "2/5")
- Color-coded based on completion percentage

---

This is how your Sublime To Do app looks and works when running on macOS!
