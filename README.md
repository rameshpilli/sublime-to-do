# Sublime To Do

A beautiful macOS productivity application for managing your daily tasks with a Claude-like sidebar interface and user authentication.

## Features

- **User Authentication**: Secure login and signup system
- **Claude-like Sidebar**: Modern split-view interface with all your past day logs accessible from the sidebar
- **Day Logs**: Organize your todos by day, with automatic date labeling
- **Todo Management**: Create, edit, complete, and delete todos with ease
- **Progress Tracking**: Visual progress indicators for each day
- **Search**: Quickly find day logs and todos
- **Persistent Storage**: All your data is saved locally

## What's Included

### 📦 Compiled Application
The `MacOS/`, `Frameworks/`, and `Resources/` directories contain the compiled macOS application bundle.

### 💻 Source Code
The `SublimeToDoApp/` directory contains the complete SwiftUI source code for the application, including:

- User authentication system
- Claude-like sidebar layout
- Day log management
- Todo CRUD operations
- Modern SwiftUI interface

See `IMPLEMENTATION_GUIDE.md` for detailed documentation on the implementation.

## Getting Started

### Using the Compiled App
1. The compiled app is ready to use in the repository
2. Requires macOS 14.6 (Sonoma) or later

### Building from Source
1. Navigate to `SublimeToDoApp/`
2. Open the project in Xcode 15.0 or later
3. Build and run (Cmd + R)

See `SublimeToDoApp/README.md` for detailed setup instructions.

## Screenshots

The application features:
- Clean, modern login screen
- Split-view interface with sidebar (like Claude)
- Day logs listed chronologically in the sidebar
- Detailed todo view with completion tracking
- Quick add todo functionality
- Search and filter capabilities

## Technology Stack

- **Language**: Swift
- **UI Framework**: SwiftUI
- **Platform**: macOS 14.6+
- **Backend**: Firebase (configured, ready to use)
- **Analytics**: PostHog
- **Data Storage**: UserDefaults (local), Core Data models included

## Documentation

- `IMPLEMENTATION_GUIDE.md` - Comprehensive guide to the features and architecture
- `SublimeToDoApp/README.md` - Source code documentation
- Project structure and code comments

## Development

Current branch: `claude/add-user-login-system-0162Xkay4eqKvmnW3UQkJFT7`

This branch adds:
- Complete user authentication system
- Claude-like sidebar interface
- Day log system for organizing todos by date
- Full CRUD operations for todos
- Modern SwiftUI implementation

## License

Sublime To Do - Productivity Application