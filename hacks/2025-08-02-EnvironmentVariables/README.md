# AL Environment Variables Demo

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to work with environment information and variables to create environment-aware applications.

## 📋 Overview

This extension showcases how to retrieve and utilize environment information in Business Central, including tenant details, environment type detection, and safe execution patterns based on environment context. It's designed as a learning resource for AL developers who want to understand how to build environment-aware solutions.

## ✨ Features

- **Environment Information Display**: Shows comprehensive environment details including domain name, tenant ID, environment name, and deployment type
- **Environment Type Detection**: Automatically detects if running on-premises, SaaS, or sandbox environments
- **Safe Execution Patterns**: Demonstrates how to restrict sensitive operations to sandbox environments only
- **Event-Driven Architecture**: Uses page event subscribers to automatically display environment info

## 🚀 How It Works

### Core Components

1. **Environment Management Codeunit** (`EnvironmentMgt.codeunit.al`)
   - Contains procedures for retrieving and displaying environment information
   - Implements safety checks for environment-sensitive operations
   - ID: 50102

2. **Environment Subscribers Codeunit** (`EnvironmentSubs.codeunit.al`)
   - Event subscriber that automatically triggers environment info display
   - Demonstrates event-driven architecture in AL
   - ID: 50103

### Workflow

1. Open the Customer List page in Business Central
2. If running in a sandbox environment, environment information is automatically displayed
3. The system shows: Domain Name, Tenant ID, Environment Name, deployment type, and sandbox status
4. Sensitive logic only executes in sandbox environments for safety

## 🛠️ Technical Details

### Key AL Concepts Demonstrated

- **Environment Information Codeunit**: Access to environment metadata and deployment context
- **Azure AD Tenant Codeunit**: Retrieval of tenant-specific information
- **Event Subscribers**: Automatic execution based on page events
- **Environment Safety Patterns**: Conditional logic execution based on environment type

### Code Snippet - Core Logic

```al
procedure ShowEnvironmentInfo()
var
    AzureADTenant: Codeunit "Azure AD Tenant";
    EnvironmentInfo: Codeunit "Environment Information";
begin
    Message(
        'Domain Name: %1 \Tenant Id: %2 \Environment Name: %3 \Is OnPrem: %4 \Is Sandbox: %5 \Is SaaS: %6',
        AzureADTenant.GetAadTenantDomainName(),
        AzureADTenant.GetAadTenantId(),
        EnvironmentInfo.GetEnvironmentName(),
        EnvironmentInfo.IsOnPrem(),
        EnvironmentInfo.IsSandbox(),
        EnvironmentInfo.IsSaaSInfrastructure()
    );
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
5. Install the extension and navigate to the Customer List to see environment info

## 🎯 Use Cases

This demo is particularly useful for:

- **AL Developers** learning environment-aware programming patterns
- **Consultants** needing to implement different behaviors per environment type
- **DevOps Teams** building deployment pipelines with environment-specific logic
- **Educational Purposes** in AL/Business Central training scenarios
- **Security-Conscious Development** ensuring sensitive operations only run in safe environments

## ⚠️ Important Considerations

- **Environment Safety**: Sensitive logic should always check environment type before execution
- **Tenant Information**: Handle tenant data according to privacy and security requirements
- **Event Subscribers**: Be mindful of performance impact when subscribing to frequently-called events
- **Testing**: Test behavior in different environment types (sandbox, production, on-premises)

## 🔧 Configuration

### ID Ranges
- Object IDs: 50102 - 50103
- All objects use the "JB" prefix for easy identification

### Dependencies
- Base Application (26.0.0.0)
- Platform (1.0.0.0)

### Environment Information Retrieved
- **Domain Name**: Azure AD tenant domain
- **Tenant ID**: Unique tenant identifier
- **Environment Name**: Current environment name
- **Is OnPrem**: Whether running on-premises
- **Is Sandbox**: Whether running in sandbox environment
- **Is SaaS**: Whether running on SaaS infrastructure

## 📝 Version History

- **26.1.0.250802**: Initial release
  - Environment information display functionality
  - Sandbox safety checks
  - Customer List page event subscriber

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
- [Environment Information Codeunit Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-codeunit-environment-information)
- [Azure AD Tenant Codeunit Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-codeunit-azure-ad-tenant)
- [Business Central AL Development](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/)
- [Event Subscribers in AL](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-events-in-al)

---

**Happy Coding! 🚀**

*This project demonstrates how to build environment-aware applications in Microsoft Dynamics 365 Business Central.*
