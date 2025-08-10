# AL ModuleInfo & Dependency Info Demo

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to retrieve, display, and manage extension module information and dependencies.

## 📋 Overview

This extension is designed for AL developers and Business Central users who want to:
- View detailed information about the installed extension (App Id, Name, Publisher)
- List all dependencies in a clear, readable format
- Register the extension and update subscription status
- Learn how to work with `ModuleInfo` and `ModuleDependencyInfo` in AL

## ✨ Features

- **ModuleInfo Display**: Shows extension details including App Id, Name, Publisher
- **Dependency Listing**: Displays all dependencies with name, publisher, and id
- **App Registration**: Register your extension and update subscription status
- **Formatted Output**: Dependencies are shown as a readable list, not raw JSON

## 🚀 How It Works

### Core Components

1. **ModuleInfo Management Codeunit** (`ModuleInfoMgt.codeunit.al`)
   - Retrieves extension details using `ModuleInfo`
   - Lists dependencies using `ModuleDependencyInfo`
   - Handles app registration and subscription status
   - ID: 50104

### Example Output

```
App Id: {D24A138F-1E1E-4427-BBF2-A5D94458A998}
Name: AL ModuleInfo
Publisher: Jeffrey Bulanadi
Dependencies:
Name: AI Test Toolkit, Publisher: Microsoft, Id: {2156302A-872F-4568-BE0B-60968696F0D5}
Name: Application, Publisher: Microsoft, Id: {C1335042-3002-4257-BF8A-75C898CCB1B8}
Name: E-Document Core, Publisher: Microsoft, Id: {E1D97EDC-C239-46B4-8D84-6368BDF67C8B}
```

## 🛠️ Technical Details

- Uses AL record types `ModuleInfo` and `ModuleDependencyInfo`
- Demonstrates how to loop through dependencies and format output
- Includes registration logic for activating the extension

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

- **AL Developers** learning how to work with extension metadata and dependencies
- **Consultants** needing to audit or document extension dependencies
- **Educational Purposes** in AL/Business Central training scenarios

## 📝 Version History

- **26.1.0.250809**: Initial release
  - ModuleInfo and dependency display
  - App registration and subscription status

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
- [ModuleInfo Record Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-moduleinfo-data-type)
- [ModuleDependencyInfo Record Documentation](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-moduledependencyinfo-data-type)

---

**Happy Coding! 🚀**

*This project demonstrates how to work with extension module info and dependencies in Microsoft Dynamics 365 Business Central.*
