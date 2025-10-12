# #BCSaturdayCodeHacks

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Business Central](https://img.shields.io/badge/Business%20Central-AL%20Language-blue.svg)](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/)
[![Weekly Updates](https://img.shields.io/badge/Updates-Every%20Saturday-green.svg)](#)

Welcome to the **code sanctuary** for Business Central developers hungry for rhythm, reusability, and real-world hacks. #BCSaturdayCodeHacks is a curated repository of modular AL code snippets and demos, designed to teach, inspire, and echo the cadence of clean architecture.

Every **Saturday**, I share a quick AL solution—whether a trick, pattern, or modular design—built for real-world impact and community learning.

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
- Modular design principles
- Performance optimization techniques

### 🛠️ Development Tools
- VS Code configurations
- Debugging strategies
- Testing frameworks
- Deployment automation

### 🔧 Real-World Solutions
- Integration patterns
- Data migration utilities
- Custom page enhancements
- Business logic implementations

## 📦 Repository Structure

```bash
BCSaturdayCodeHacks/
├── 📁 hacks/                    # Individual hack folders
│   ├── 📁 2025-07-26-ChangeCompanyDemo/          # Cross-company G/L Account sync
│   ├── 📁 2025-08-02-EnvironmentVariables/       # Environment-aware programming
│   ├── 📁 2025-08-09-ModuleInfo/                 # Module information management
│   ├── 📁 2025-08-16-RoleCenterNotificationMgt/  # Role Center notification events
│   ├── 📁 2025-08-23-NoficationsDataType/        # Notification Data Type implementation
│   ├── 📁 2025-08-30-OAuthAutomationSetupP1/     # OAuth automation setup - Part 1 (Entra ID)
│   ├── 📁 2025-09-06-OAuthAutomationSetupP2/     # OAuth automation setup - Part 2 (Postman & BC)
│   └── 📁 [upcoming-hacks]/                      # More weekly demos
├── 📁 docs/                     # Comprehensive guides & tutorials
├── 📁 assets/                   # Screenshots, diagrams, visuals
├── 📁 .github/                  # Templates for issues & contributions
├── 📄 LICENSE                   # MIT License
└── 📄 README.md                 # This file
```

## 🗓️ Featured Hacks

Explore the latest and greatest AL hacks, updated every Saturday! Each demo is designed to teach a practical concept for Business Central developers.

### 🆕 Latest: [OAuth Automation Setup - Part 2: Postman & BC Integration](hacks/2025-09-06-OAuthAutomationSetupP2/) **(September 6, 2025)**
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
   git clone https://github.com/your-username/BCSaturdayCodeHacks.git
   cd BCSaturdayCodeHacks
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
3. **Commit** your changes (`git commit -m 'Add amazing Saturday hack'`)
4. **Push** to the branch (`git push origin feature/amazing-hack`)
5. **Open** a Pull Request

### Community Guidelines
- **Quality over Quantity** - Each hack should teach something valuable
- **Clean Code** - Follow AL best practices and naming conventions
- **Documentation** - Include comprehensive READMEs and code comments
- **Respectful** - Maintain a welcoming environment for all skill levels

## 📈 Project Statistics

- **Started:** July 2025
- **Total Hacks:** 7 (and growing every Saturday!)
- **Focus Areas:** AL Development, Business Central Extensions, OAuth Integration, API Automation
- **Target Audience:** Developers, Consultants, Solution Architects

## Stay Connected

- **Weekly Updates** - Star this repo to get notified of new Saturday hacks
- **Discussions** - Use GitHub Discussions for questions and ideas
- **Issues** - Report bugs or request specific hack topics
- **Social** - Follow the journey on LinkedIn and Twitter

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Jeffrey Bulanadi** - Creator and maintainer of #BCSaturdayCodeHacks, passionate AL developer sharing knowledge every Saturday
- **Microsoft Dynamics 365 Business Central Team** - For the amazing AL language and platform
- **BC Community** - For continuous inspiration and knowledge sharing
- **Contributors** - Everyone who makes this project better

---

<div align="center">

**🌟 Star this repo if it helps your AL journey! 🌟**

*Built with ❤️ for the Business Central developer community*

**Happy Coding! 🚀**

</div>
