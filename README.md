# #BCWeekendCodeHacks

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Business Central](https://img.shields.io/badge/Business%20Central-AL%20Language-blue.svg)](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/)
[![Weekly Updates](https://img.shields.io/badge/Updates-Every%20Weekend-green.svg)](#)

Welcome to the **code sanctuary** for Business Central developers hungry for rhythm, reusability, and real-world hacks. #BCWeekendCodeHacks is a curated repository of modular AL code snippets and demos, designed to teach, inspire, and echo the cadence of clean architecture.

Every **Weekend**, I share a quick AL solution—whether a trick, pattern, or modular design—built for real-world impact and community learning.

## 🎯 Purpose

This repository is a weekly celebration of:

- **Modular AL Learning** - Bite-sized, focused examples that teach specific concepts
- **Practical Scenarios** - Real-world implementations from actual consulting projects
- **Scalable Patterns** - Architecture solutions for consultants and enterprise developers
- **Community Knowledge** - Collaborative learning and knowledge sharing
- **Best Practices** - Clean code principles applied to AL development

## 📊 What You'll Find Here

### 🏗️ Architecture Patterns
- Cross-company data operations
- Environment-aware programming
- Event-driven programming
- Role Center event handling
- Notification data type implementation
- OAuth 2.0 authentication flows
- API integration and automation
- Collection automation and scripting
- Token lifecycle management
- Azure CLI automation and DevOps
- Infrastructure as Code practices
- REST API consumption patterns
- PowerShell integration workflows
- Data lifecycle management and archiving
- Retention policies and data cleanup
- RecordRef patterns for bulk operations
- Modular design principles
- Performance optimization techniques

### 🛠️ Development Tools
- VS Code configurations
- Azure CLI automation
- PowerShell scripting
- Debugging strategies
- Testing frameworks
- Deployment automation

### 🔧 Real-World Solutions
- Integration patterns
- REST API consumption
- PowerShell automation scripts
- Data archiving and retention
- Test data generation utilities
- Data migration utilities
- Custom page enhancements
- Business logic implementations

## 📦 Repository Structure

```bash
BCWeekendCodeHacks/
├── 📁 hacks/                    # Individual hack folders
│   ├── 📁 2025-07-12-FindRecordManagement/       # Find Record Management utility
│   ├── 📁 2025-07-19-BigTextDemo/                # BigText data type for large content
│   ├── 📁 2025-07-26-ChangeCompanyDemo/          # Cross-company G/L Account sync
│   ├── 📁 2025-08-02-EnvironmentVariables/       # Environment-aware programming
│   ├── 📁 2025-08-09-ModuleInfo/                 # Module information management
│   ├── 📁 2025-08-16-RoleCenterNotificationMgt/  # Role Center notification events
│   ├── 📁 2025-08-23-NoficationsDataType/        # Notification Data Type implementation
│   ├── 📁 2025-08-30-OAuthAutomationSetupP1/     # OAuth automation setup - Part 1 (Entra ID)
│   ├── 📁 2025-09-06-OAuthAutomationSetupP2/     # OAuth automation setup - Part 2 (Postman & BC)
│   ├── 📁 2025-09-13-OAuthAutomationSetupP3/     # OAuth automation setup - Part 3 (Collection Automation)
│   ├── 📁 2025-09-20-OAuthAutomationSetupP4/     # OAuth automation setup - Part 4 (Azure CLI Automation)
│   ├── 📁 2025-09-27-OauthAutomationSetupP5/     # OAuth automation setup - Part 5 (PowerShell API Integration)
│   ├── 📁 2025-11-02-DataArchiveCodeunit/        # Data Archive functionality for lifecycle management
│   └── 📁 [upcoming-hacks]/                      # More weekly demos
├── 📁 docs/                     # Comprehensive guides & tutorials
├── 📁 assets/                   # Screenshots, diagrams, visuals
├── 📁 .github/                  # Templates for issues & contributions
├── 📄 LICENSE                   # MIT License
└── 📄 README.md                 # This file
```

## 🗓️ Featured Hacks

Explore the latest and greatest AL hacks, updated every weekend (Saturday or Sunday)! Each demo is designed to teach a practical concept for Business Central developers.

### 🆕 Latest: [Data Archive Codeunit Demo](hacks/2025-11-02-DataArchiveCodeunit/) **(November 2, 2025)**
Complete guide to implementing Data Archive functionality for efficient data lifecycle management in Business Central, featuring:
- ✅ Full Data Archive integration using Business Central's built-in functionality
- ✅ Automated test data seeder creating 75 realistic case records (50 old + 25 current)
- ✅ Smart bulk archiving with SaveRecords() pattern for reliable operations
- ✅ 3-year retention policy with automatic cutoff date calculation
- ✅ Management interface with statistics and one-click archive/seed/delete operations
- ✅ RecordRef patterns for efficient data operations and filtering
- ✅ Professional archive naming with record counts and timestamps
- ✅ Complete table, codeunit, and page implementations

> **Tech Stack:** AL Language, Business Central 26.2+, Data Archive Codeunit, RecordRef, VS Code
> 
> **Key Concepts:** Data lifecycle management, Retention policies, Bulk operations, RecordRef patterns, Test data generation, Archive naming conventions, Data cleanup

### Previous: [OAuth Automation Setup - Part 5: PowerShell API Integration](hacks/2025-09-27-OauthAutomationSetupP5/) **(September 27, 2025)**
Master PowerShell scripting for complete OAuth 2.0 token acquisition and Business Central API integration, featuring:
- ✅ PowerShell OAuth 2.0 token acquisition using Invoke-RestMethod
- ✅ Dynamic token management with OAuth v2 endpoints
- ✅ Business Central API consumption with Bearer authentication
- ✅ Reusable PowerShell scripts for companies endpoint queries
- ✅ Complete end-to-end API workflow from authentication to data retrieval
- ✅ Production-ready scripts with error handling and best practices

> **Tech Stack:** PowerShell, OAuth 2.0, Business Central APIs, REST APIs, Invoke-RestMethod, Bearer Tokens
> 
> **Key Concepts:** PowerShell scripting, REST API consumption, OAuth token management, API authentication flows, Script automation, Integration patterns

### Previous: [OAuth Automation Setup - Part 4: Azure CLI Automation](hacks/2025-09-20-OAuthAutomationSetupP4/) **(September 20, 2025)**
Complete guide to automating Azure AD app registration using Azure CLI for Business Central OAuth setup, featuring:
- ✅ Azure CLI installation and configuration with PowerShell
- ✅ Azure authentication and account management workflows
- ✅ Automated app registration with Business Central API permissions
- ✅ Command-line client secret generation and management
- ✅ Admin consent automation for delegated permissions
- ✅ Single-command app creation with complete JSON configuration

> **Tech Stack:** Azure CLI, PowerShell, Microsoft Entra ID, Business Central APIs, OAuth 2.0, JSON Configuration
> 
> **Key Concepts:** CLI automation, Infrastructure as Code, App registration automation, DevOps practices, Command-line scripting, Azure AD management

### Previous: [OAuth Automation Setup - Part 3: Collection Automation](hacks/2025-09-13-OAuthAutomationSetupP3/) **(September 13, 2025)**
Advanced Postman collection automation for streamlined Business Central API workflows, featuring:
- ✅ Automated token management with Bearer authentication setup
- ✅ Collection-level scripts for token handling and expiration tracking
- ✅ HTTP request configuration for Business Central APIs
- ✅ Variable management for dynamic token and expiration handling
- ✅ Complete workflow from token acquisition to successful API calls

> **Tech Stack:** Postman Collections, Bearer Tokens, Business Central APIs, OAuth 2.0, JavaScript (Pre-request Scripts)
> 
> **Key Concepts:** Collection automation, Token lifecycle management, API request optimization, Bearer authentication, Postman scripting

### Previous: [OAuth Automation Setup - Part 2: Postman & BC Integration](hacks/2025-09-06-OAuthAutomationSetupP2/) **(September 6, 2025)**
Comprehensive tutorial for setting up OAuth automation with Postman and Business Central integration, featuring:
- ✅ Postman workspace and collection setup for Business Central APIs
- ✅ OAuth 2.0 configuration and token acquisition workflows
- ✅ Business Central Entra ID application configuration
- ✅ Variable management and request automation in Postman
- ✅ Step-by-step visual guide with detailed screenshots

> **Tech Stack:** Postman, Microsoft Entra ID, Business Central APIs, OAuth 2.0
> 
> **Key Concepts:** API testing, OAuth automation, Postman collections, Business Central integration, Token management

### Previous: [OAuth Automation Setup - Part 1: Microsoft Entra ID](hacks/2025-08-30-OAuthAutomationSetupP1/) **(August 30, 2025)**
Detailed guide for setting up OAuth automation with Microsoft Entra ID for Business Central, featuring:
- ✅ Microsoft Entra ID app registration process
- ✅ API permissions configuration for Business Central
- ✅ Client secrets management and security setup
- ✅ Admin consent workflow for delegated permissions
- ✅ Complete visual walkthrough with Azure portal screenshots

> **Tech Stack:** Microsoft Entra ID, Azure Portal, Business Central APIs, OAuth 2.0
> 
> **Key Concepts:** App registration, API permissions, OAuth setup, Azure AD configuration, Security best practices

### Previous: [AL Notification Data Type Demo](hacks/2025-08-23-NoficationsDataType/) **(August 23, 2025)**
Demonstrates advanced notification implementation using the Notification data type in Business Central, featuring:
- ✅ Interactive notifications with multiple action buttons
- ✅ Role Center event integration with OnBeforeShowNotifications
- ✅ License activation reminder use case implementation
- ✅ Non-blocking notification messages and user workflow

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** Notification data type, Interactive notifications, Action buttons, Event-driven architecture

### Previous: [AL Role Center Notification Management](hacks/2025-08-16-RoleCenterNotificationMgt/) **(August 16, 2025)**
Demonstrates Role Center event handling and notification management in Business Central, featuring:
- ✅ Role Center event subscribers using OnBeforeShowNotifications
- ✅ Event-driven architecture with customer data manipulation
- ✅ Customer table and page extensions
- ✅ Demo customer creation and management functionality

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** Event subscribers, Role Center notifications, Table extensions, Customer management

### Previous: [AL Module Info Demo](hacks/2025-08-09-ModuleInfo/) **(August 9, 2025)**
Demonstrates module information management in Business Central, featuring:
- ✅ Display and manage module metadata
- ✅ Custom setup page and table for module info
- ✅ Permission set for module administration
- ✅ Screenshots and documentation for easy onboarding

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** Custom table/page, codeunit for module info, permission sets, extensibility

### Earlier: [AL Environment Variables Demo](hacks/2025-08-02-EnvironmentVariables/) **(August 2, 2025)**
Demonstrates environment-aware programming in Business Central, featuring:
- ✅ Environment information retrieval (tenant, domain, deployment type)
- ✅ Safety patterns for sandbox-only operations
- ✅ Event-driven architecture with page subscribers
- ✅ Automatic environment detection and display

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** Environment Information codeunit, Azure AD Tenant codeunit, Event subscribers, Environment safety patterns

### Earlier: [AL ChangeCompany Demo](hacks/2025-07-26-ChangeCompanyDemo/) **(July 26, 2025)**
Demonstrates cross-company data operations in Business Central, featuring:
- ✅ G/L Account synchronization across companies
- ✅ Interactive company selection dialog
- ✅ Smart duplicate prevention
- ✅ Seamless UI integration

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** ChangeCompany method, Record.TransferFields(), Cross-company operations

### Earlier: [BigText Data Type Demo](hacks/2025-07-19-BigTextDemo/) **(July 19, 2025)**
Demonstrates BigText data type for handling large text content in Business Central, featuring:
- ✅ HTML content storage using BigText and Blob fields
- ✅ File upload functionality for HTML specifications
- ✅ Rich content display with ExtendedDatatype property
- ✅ Stream-based data handling (InStream/OutStream)
- ✅ Item Card extension with HTML description field
- ✅ Production-ready pattern for large document management

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code, HTML
> 
> **Key Concepts:** BigText data type, Blob fields, InStream/OutStream, File upload, Rich content, Table/Page extensions

### Earlier: [Find Record Management Demo](hacks/2025-07-12-FindRecordManagement/) **(July 12, 2025)**
Demonstrates using the Find Record Management codeunit for efficient record operations, featuring:
- ✅ Efficient last record retrieval using system codeunits
- ✅ GetLastEntryIntFieldValue method implementation
- ✅ Comparison with traditional FindLast() approach
- ✅ Performance optimization for entry number queries
- ✅ Drill-down functionality to related records
- ✅ Best practices for working with ledger entries

> **Tech Stack:** AL Language, Business Central 26.0+, VS Code
> 
> **Key Concepts:** Find Record Management codeunit, Record retrieval optimization, System codeunits, Performance patterns

### 🔮 Coming Soon
Stay tuned for upcoming hacks:
- **Advanced API Integration** – Complex web service patterns and error handling
- **Performance Optimization** – Query efficiency and data handling
- **Custom Control Add-ins** – JavaScript integration with AL
- **Automated Testing** – Unit testing strategies for AL
- **OAuth in AL Code** – Implementing OAuth flows directly in Business Central extensions

## 🚀 Quick Start

### For Developers
1. **Clone the repository**
   ```bash
   git clone https://github.com/jeffreybulanadi/BCWeekendCodeHacks.git
   cd BCWeekendCodeHacks
   ```

2. **Explore a hack**
   ```bash
   cd hacks/2025-08-23-NoficationsDataType
   code .  # Opens in VS Code
   ```

3. **Follow the README** in each hack folder for specific setup instructions

### For Learners
1. Browse the `hacks/` folder for topics that interest you
2. Each hack includes a comprehensive README with:
   - Overview and use cases
   - Technical implementation details
   - Installation instructions
   - Learning outcomes

## 🎓 Learning Path

### Beginner
- Start with basic page extensions
- Understand AL syntax and structure
- Learn about Business Central object types

### Intermediate
- Explore cross-company operations
- Master environment-aware programming
- Master event-driven programming
- Implement custom business logic

### Advanced
- Design scalable architecture patterns
- Optimize performance and memory usage
- Build complex integration solutions

## 🤝 Community & Contribution

### How to Contribute
1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-hack`)
3. **Commit** your changes (`git commit -m 'Add amazing weekend hack'`)
4. **Push** to the branch (`git push origin feature/amazing-hack`)
5. **Open** a Pull Request

### Community Guidelines
- **Quality over Quantity** - Each hack should teach something valuable
- **Clean Code** - Follow AL best practices and naming conventions
- **Documentation** - Include comprehensive READMEs and code comments
- **Respectful** - Maintain a welcoming environment for all skill levels

## 📈 Project Statistics

- **Started:** July 2025
- **Total Hacks:** 13 (and growing every weekend!)
- **Focus Areas:** AL Development, Business Central Extensions, OAuth Integration, API Automation, DevOps & CLI Tools, PowerShell Scripting, Data Lifecycle Management
- **Target Audience:** Developers, Consultants, Solution Architects

## Stay Connected

- **Weekly Updates** - Star this repo to get notified of new weekend hacks
- **Discussions** - Use GitHub Discussions for questions and ideas
- **Issues** - Report bugs or request specific hack topics
- **Social** - Follow the journey on LinkedIn and Twitter

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Jeffrey Bulanadi** - Creator and maintainer of #BCWeekendCodeHacks, passionate AL developer sharing knowledge every weekend
- **Microsoft Dynamics 365 Business Central Team** - For the amazing AL language and platform
- **BC Community** - For continuous inspiration and knowledge sharing
- **Contributors** - Everyone who makes this project better

---

<div align="center">

**🌟 Star this repo if it helps your AL journey! 🌟**

*Built with ❤️ for the Business Central developer community*

**Happy Coding! 🚀**

</div>