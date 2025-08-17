# AL Role Center Notification Management

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to hook into the Role Center before it fully loads using the `OnBeforeShowNotifications` event.

## 📋 Overview

This extension is designed for AL developers and Business Central users who want to:
- Learn how to use Role Center notification events
- Understand event-driven programming in AL
- See practical examples of customer data manipulation
- Explore Customer table and page extensions

## ✨ Features

- **Role Center Event Handling**: Hooks into the Role Center before notifications are shown
- **Demo Customer Creation**: Automatically creates demo customers when the Role Center loads
- **Customer Management**: Includes functionality to delete selected customers
- **Event-Driven Architecture**: Demonstrates proper event subscriber patterns
- **Table Extensions**: Shows how to extend the Customer table with custom fields

## 🚀 How It Works

### Core Components

1. **Event Subscribers Codeunit** (`EventSubscribers.codeunit.al`)
   - Subscribes to the `OnBeforeShowNotifications` event from Role Center Notification Mgt.
   - Acts as the entry point for custom logic before Role Center loads
   - ID: 50106

2. **Event Handler Codeunit** (`EventHandler.codeunit.al`)
   - Contains the business logic for handling Role Center events
   - Creates demo customers with predefined names
   - Manages customer number generation and setup
   - ID: 50107

3. **Customer Table Extension** (`Customer.TableExt.al`)
   - Extends the Customer table with an "Is Demo" boolean field
   - Used to identify and filter demo customers
   - Field ID: 50106

4. **Customer List Page Extension** (`CustomerList.PageExt.al`)
   - Adds a "Delete Selected Customers" action to the Customer List page
   - Allows bulk deletion of selected customer records
   - Demonstrates page extension capabilities

### Event Flow

1. Role Center starts loading
2. `OnBeforeShowNotifications` event is triggered
3. Event subscriber catches the event and calls the handler
4. Handler creates demo customers with predefined names
5. User is prompted to open the Customer List if new customers were created

### Demo Customers Created

The extension automatically creates the following demo customers:
- Isshin Ashina
- Aden Pierce
- Jeffrey Bulanadi
- Taylor NotTooWell
- Mr. P Sherman
- John Doe
- Juan Lazy
- Mad Afaka

## 🛠️ Technical Details

- **Object ID Range**: 50106-50107
- **Platform Version**: 1.0.0.0
- **Application Version**: 26.0.0.0 or later
- **Runtime Version**: 15.0
- **Features**: NoImplicitWith, TranslationFile
- Uses event subscriber pattern for Role Center integration
- Demonstrates proper AL coding practices with codeunit separation
- Includes translation support (.xlf files)
- No external dependencies required

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

- **AL Developers** learning event-driven programming and Role Center customization
- **Training Scenarios** demonstrating proper event subscriber patterns
- **Demo Environments** that need quick customer data setup
- **Educational Purposes** for understanding table and page extensions
- **Code Examples** for Role Center notification management

## 📝 Version History

- **26.1.0.250816**: Initial release
  - Role Center event subscription implementation
  - Demo customer creation functionality
  - Customer table extension with "Is Demo" field
  - Customer List page extension with bulk delete action

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
- [Role Center Notification Management](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-role-center-notification-mgt)
- [Event Subscriber Pattern](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-events)
- [Table Extensions](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-table-ext-object)
- [Page Extensions](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-page-ext-object)

---

**Happy Coding! 🚀**

*This project demonstrates Role Center event handling and customer management in Microsoft Dynamics 365 Business Central.*
