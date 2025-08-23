# AL Notification Data Type Demo

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to implement and manage notifications using the Notification data type. This extension shows how to hook into the Role Center before it fully loads and display interactive notifications with multiple action buttons.

## 📋 Overview

This extension is designed for AL developers and Business Central users who want to:
- Learn how to implement the Notification data type in AL
- Understand how to create interactive notifications with multiple actions
- See practical examples of event-driven programming in AL
- Explore Role Center notification management
- Learn notification action handling patterns

## ✨ Features

- **Role Center Event Handling**: Hooks into the Role Center before notifications are shown
- **Interactive Notifications**: Displays notifications with multiple clickable actions
- **License Activation Reminder**: Demonstrates a practical use case for notifications
- **Multiple Action Buttons**: Shows how to add multiple actions to a single notification
- **Event-Driven Architecture**: Demonstrates proper event subscriber patterns
- **Non-Blocking Messages**: Notifications that don't disrupt user workflow

## 🚀 How It Works

### Core Components

1. **Event Subscribers Codeunit** (`EventSubscribers.codeunit.al`)
   - Subscribes to the `OnBeforeShowNotifications` event from Role Center Notification Mgt.
   - Acts as the entry point for custom logic before Role Center loads
   - ID: 50108

2. **Event Handler Codeunit** (`EventHandler.codeunit.al`)
   - Contains the business logic for handling Role Center events
   - Triggers the notification management system
   - ID: 50109

3. **Notification Management Codeunit** (`NotificationMgt.codeunit.al`)
   - Core notification logic and message creation
   - Defines notification content and action buttons
   - Manages notification scope and delivery
   - ID: 50110

4. **Notification Handler Codeunit** (`NotificationHandler.codeunit.al`)
   - Handles user interactions with notification actions
   - Contains methods for each notification action button
   - Processes user responses to notifications
   - ID: 50111

### Event Flow

1. Role Center starts loading
2. `OnBeforeShowNotifications` event is triggered
3. Event subscriber catches the event and calls the handler
4. Handler calls the Notification Management codeunit
5. Notification Management creates and sends a license activation reminder
6. User sees notification with multiple action buttons:
   - **"Activate now"** - triggers license activation
   - **"Remind me in 10 billion days"** - defers the reminder
   - **"Don't show this again"** - suppresses future notifications
7. User clicks an action, and the corresponding method in Notification Handler is executed

### Notification Actions

The extension demonstrates three types of notification actions:
- **Immediate Action**: "Activate now" - for immediate user response
- **Deferred Action**: "Remind me in 10 billion days" - for postponing the action
- **Dismissal Action**: "Don't show this again" - for permanently dismissing the notification

### Technical Implementation

The notification system uses:
- **LocalScope**: Notifications are scoped to the current user session
- **AddAction Method**: Multiple actions are added using the AddAction method
- **Codeunit Reference**: Each action references the Notification Handler codeunit
- **Method Names**: Action methods must be public and accept a Notification parameter

## 🛠️ Technical Details

- **Object ID Range**: 50108-50111
- **Platform Version**: 1.0.0.0
- **Application Version**: 26.0.0.0 or later
- **Runtime Version**: 15.0
- **Features**: NoImplicitWith, TranslationFile
- Uses event subscriber pattern for Role Center integration
- Demonstrates Notification data type implementation
- Shows multiple action handling in notifications
- Includes proper notification scope management
- No external dependencies required

### Code Structure

```al
// Notification creation with multiple actions
UserNotification.Message('My Not So Booooooring App has been installed. Would you like to activate it?');
UserNotification.Scope := NotificationScope::LocalScope;

UserNotification.AddAction('Activate now', Codeunit::"JB Notification Handler", 'ActivateLicense');
UserNotification.AddAction('Remind me in 10 billion days', Codeunit::"JB Notification Handler", 'RemindLater');
UserNotification.AddAction('Don''t show this again', Codeunit::"JB Notification Handler", 'DismissNotification');

UserNotification.Send();
```

## 📦 Installation

### Prerequisites
- Microsoft Dynamics 365 Business Central (Version 26.0 or later)
- AL Development Environment

### Deployment Steps
1. Clone or download this repository
2. Open the project in Visual Studio Code with AL Language extension
3. Compile and publish the extension to your Business Central environment
4. Install the extension and use the provided codeunit to view module info and dependencies

## 🎯 Use Cases

- **AL Developers** learning Notification data type implementation
- **Training Scenarios** demonstrating interactive notification patterns
- **License Management** systems requiring user activation prompts
- **Educational Purposes** for understanding notification scope and actions
- **Code Examples** for Role Center notification management
- **User Experience Enhancement** with non-blocking informational messages
- **Multi-Action Notifications** requiring user choice between multiple options

## 📝 Version History

- **26.1.0.250823**: Initial release
  - Role Center event subscription implementation
  - Notification data type demonstration
  - Multiple notification actions support
  - License activation reminder functionality
  - Interactive notification handling

## 👨‍💻 Author

**Jeffrey Bulanadi**
- Publisher: Jeffrey Bulanadi
- Part of the Dynamics Community project collection

## 📄 License

This project is provided as-is for educational and demonstration purposes. Please ensure compliance with Microsoft's licensing terms when using in production environments.

## 🤝 Contributing

Suggestions and improvements are welcome! Feel free to:
- Report issues
- Suggest enhancements
- Share your own implementations
- Contribute to the Dynamics Community

## 📚 Additional Resources

- [Microsoft AL Language Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
- [Notification Data Type Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/notification/notification-data-type)
- [Role Center Notification Management](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-role-center-notification-mgt)
- [Event Subscriber Pattern](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-events)
- [AL Method Reference for Notifications](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/notification/)

---

**Happy Coding! 🚀**

*This project demonstrates the Notification data type implementation and interactive notification management in Microsoft Dynamics 365 Business Central.*
