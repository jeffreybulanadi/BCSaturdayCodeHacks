# AL ChangeCompany Demo

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to use the `ChangeCompany` functionality to synchronize G/L Accounts across multiple companies within the same database.

## 📋 Overview

This extension showcases a practical implementation of cross-company data operations in Business Central, specifically focusing on copying G/L Account records from one company to another. It's designed as a learning resource for AL developers who want to understand how to work with multi-company scenarios.

## ✨ Features

- **Cross-Company G/L Account Synchronization**: Copy G/L Account records from the current company to any other company in the same database
- **Interactive Company Selection**: User-friendly company picker dialog
- **Smart Duplicate Handling**: Prevents creation of duplicate G/L Accounts in the destination company
- **Seamless UI Integration**: Adds a new action directly to the G/L Account Card page

## 🚀 How It Works

### Core Components

1. **ChangeCompany Management Codeunit** (`ChangeCompanyMgt.codeunit.al`)
   - Contains the main logic for cross-company operations
   - Handles company selection and G/L Account synchronization
   - ID Range: 50101

2. **G/L Account Card Page Extension** (`GLAccountCard.PageExt.al`)
   - Extends the standard G/L Account Card page
   - Adds "Copy G/L Account to Selected Company" action
   - ID Range: 50101

### Workflow

1. Navigate to any G/L Account Card in Business Central
2. Click the "Copy G/L Account to Selected Company" action
3. Select the destination company from the company list
4. The G/L Account is copied to the selected company (if it doesn't already exist)
5. Receive confirmation message upon successful completion

## 🛠️ Technical Details

### Key AL Concepts Demonstrated

- **ChangeCompany() Method**: Switches the context to work with records in different companies
- **Record.TransferFields()**: Efficiently copies field values between records
- **Page.RunModal()**: Displays modal dialogs for user interaction
- **Cross-Company Record Operations**: Safe handling of records across company boundaries

### Code Snippet - Core Logic

```al
if Company.ChangeCompany(DestinationCompany) then
    DestinationGL.ChangeCompany(DestinationCompany);

if not DestinationGL.Get(SourceGL."No.") then begin
    DestinationGL.Init();
    DestinationGL.TransferFields(SourceGL);
    DestinationGL.Insert();
end;
```

## 📦 Installation

### Prerequisites

- Microsoft Dynamics 365 Business Central (Version 26.0 or later)
- AL Development Environment
- Access to multiple companies in the same database

### Deployment Steps

1. Clone or download this repository
2. Open the project in Visual Studio Code with AL Language extension
3. Update the `app.json` file with your publisher information if needed
4. Compile and publish the extension to your Business Central environment
5. Install the extension in your target companies

## 🎯 Use Cases

This demo is particularly useful for:

- **AL Developers** learning cross-company programming patterns
- **Consultants** needing to synchronize master data across companies
- **Educational Purposes** in AL/Business Central training scenarios
- **Proof of Concepts** for multi-company data management solutions

## ⚠️ Important Considerations

- **Permissions**: Ensure users have appropriate permissions for both source and destination companies
- **Data Integrity**: The extension checks for existing records to prevent duplicates
- **Testing**: Always test in a development/sandbox environment before production use
- **Company Context**: The extension works within the same database only

## 🔧 Configuration

### ID Ranges
- Object IDs: 50100 - 50149
- All objects use the "JB" prefix for easy identification

### Dependencies
- Base Application (26.0.0.0)
- Platform (1.0.0.0)

## 📝 Version History

- **26.1.0.250726**: Initial release
  - Basic G/L Account synchronization functionality
  - Company selection dialog
  - Page extension with action integration

## 👨‍💻 Author

**Jeffrey Bulanadi**
- Publisher: Jeffrey Bulanadi
- Part of the Dynamics Community project collection

## 📄 License

This project is provided as-is for educational and demonstration purposes. Please ensure compliance with Microsoft's licensing terms when using in production environments.

## 🤝 Contributing

This is a demo project, but suggestions and improvements are welcome! Feel free to:
- Report issues
- Suggest enhancements
- Share your own implementations
- Contribute to the Dynamics Community

## 📚 Additional Resources

- [Microsoft AL Language Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
- [ChangeCompany Method Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/record/record-changecompany-method)
- [Business Central AL Development](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/)

---

**Happy Coding! 🚀**

*This project demonstrates the power and flexibility of AL programming in Microsoft Dynamics 365 Business Central.*
