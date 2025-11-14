# Sublime To Do - Source Code

A beautiful macOS to-do application with user authentication and a Claude-like sidebar interface for managing daily task logs.

## Features

✨ **User Authentication**
- Login and signup functionality
- Secure user session management
- Firebase authentication ready

📱 **Claude-like Interface**
- Split-view layout with sidebar
- Elegant, modern SwiftUI design
- Responsive and intuitive navigation

📝 **Day Logs**
- Organize todos by day
- View past day logs in the sidebar
- Track completion progress
- Search functionality

✅ **Todo Management**
- Create, read, update, and delete todos
- Mark todos as complete
- Add descriptions to todos
- View completion timestamps

## Architecture

### Models
- **User**: User account information
- **TodoItem**: Individual task with metadata
- **DayLog**: Container for todos organized by date

### Services
- **AuthenticationService**: Handles user login/signup/logout
- **TodoService**: Manages day logs and todos with persistence

### Views
- **LoginView**: Authentication interface
- **MainView**: Main app with sidebar layout
- **DayLogDetailView**: Todo list for selected day
- **NewDayLogSheet**: Create new day log
- **EditTodoSheet**: Edit existing todo

## Project Structure

```
SublimeToDoApp/
├── SublimeToDoApp.swift          # Main app entry point
├── Models/
│   ├── User.swift                # User data model
│   ├── TodoItem.swift            # Todo item model
│   └── DayLog.swift              # Day log model
├── Services/
│   ├── AuthenticationService.swift  # Auth management
│   └── TodoService.swift         # Todo/DayLog management
├── Views/
│   ├── LoginView.swift           # Login/signup UI
│   ├── MainView.swift            # Main interface with sidebar
│   ├── DayLogDetailView.swift   # Day log detail view
│   ├── NewDayLogSheet.swift     # Create day log sheet
│   └── EditTodoSheet.swift      # Edit todo sheet
└── Resources/                    # Assets and resources
```

## Setup Instructions

### Prerequisites
- Xcode 15.0 or later
- macOS 14.6 (Sonoma) or later
- Swift 5.9+

### Installation

1. **Open in Xcode**
   ```bash
   cd SublimeToDoApp
   open SublimeToDoApp.xcodeproj
   ```

2. **Configure Firebase** (Optional - for cloud sync)
   - Add your `GoogleService-Info.plist` to the project
   - Enable Firebase Authentication in Firebase Console
   - Update authentication methods in `AuthenticationService.swift`

3. **Build and Run**
   - Select your target device/simulator
   - Press `Cmd + R` to build and run

## Data Persistence

The app currently uses UserDefaults for local data storage:
- User session data
- Day logs and todos

For production use, consider migrating to:
- Core Data (already configured in original app)
- Firebase Firestore (for cloud sync)
- CloudKit (for iCloud sync)

## Customization

### Theming
Modify colors in the views:
- `LoginView.swift`: Login screen gradient and colors
- `MainView.swift`: Sidebar and main view styling

### Firebase Integration
To enable full Firebase authentication:
1. Uncomment Firebase Auth imports
2. Update `AuthenticationService.swift` methods
3. Replace mock authentication with Firebase calls

## Future Enhancements

- [ ] Cloud sync with Firebase
- [ ] Recurring todos
- [ ] Tags and categories
- [ ] Notifications and reminders
- [ ] Dark mode support
- [ ] Export functionality
- [ ] Keyboard shortcuts
- [ ] Multi-user collaboration

## License

This project is part of the Sublime To Do application.

## Support

For issues or questions, please create an issue in the repository.
