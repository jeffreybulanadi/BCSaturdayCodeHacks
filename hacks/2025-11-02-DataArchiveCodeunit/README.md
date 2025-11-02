# Data Archive Codeunit Demo

A Microsoft Dynamics 365 Business Central AL extension that demonstrates how to implement and use the Data Archive functionality for archiving and managing old records. This extension provides a complete example of data lifecycle management with test data generation, archival, and deletion capabilities.

## 📋 Overview

This extension is designed for AL developers and Business Central users who want to:
- Learn how to implement Data Archive functionality in Business Central
- Understand data lifecycle management and retention policies
- Generate test data for archive functionality testing
- See practical examples of bulk record archiving
- Explore RecordRef patterns for efficient data operations
- Learn best practices for data cleanup and archive naming

## ✨ Features

- **Data Archive Integration**: Full implementation of Business Central's Data Archive functionality
- **Test Data Generation**: Automated seeder that creates 75 realistic test records (50 old + 25 current)
- **Smart Date Generation**: Creates records with completion dates spanning 3-5 years ago and recent dates
- **Bulk Archive Operations**: Efficient SaveRecords() pattern for archiving multiple records at once
- **Management Interface**: User-friendly page with statistics and one-click operations
- **List View with Filtering**: Easy-to-use list page with old/recent/all case filters
- **Progress Tracking**: Visual feedback during data generation
- **Professional Archive Naming**: Dynamic archive names with record counts and cutoff dates

## 🚀 How It Works

### Core Components

1. **Case Table** (`Case.table.al`)
   - Custom table for storing case records
   - Fields: ID, Project No., Customer No., Customer Name, Completion Date, Total Amount
   - Primary Key: Project No.
   - ID: 50100

2. **Archive Old Case Codeunit** (`ArchiveOldCase.codeunit.al`)
   - Core archive functionality using Data Archive codeunit
   - Implements the SaveRecords() pattern for reliable archiving
   - Calculates 3-year cutoff date automatically
   - Archives and deletes old records in a single operation
   - Uses professional naming convention with record counts
   - ID: 50100

3. **Case Data Seeder Codeunit** (`CaseDataSeeder.codeunit.al`)
   - Generates realistic test data for archive testing
   - Creates 50 old cases (3-5 years old) with OLD prefix
   - Creates 25 recent cases (last 6 months) with CUR prefix
   - Includes progress dialog and statistics
   - Smart customer assignment from existing records
   - Random amount generation based on age
   - ID: 50101

4. **Case Data Management Page** (`CaseDataManagement.page.al`)
   - Administrative interface for data operations
   - Real-time statistics (Total, Old, Recent cases)
   - One-click actions: Generate Test Data, Archive Old Cases
   - Built with TextBuilder for clean UI messages
   - Refresh capability for updated statistics
   - ID: 50101

5. **Case List Page** (`CaseList.page.al`)
   - List view of all Case records
   - Filter actions: Show Old Cases, Show Recent Cases, Show All Cases
   - Direct navigation to management page
   - Clean repeater layout
   - ID: 50102

### Workflow

1. **Open Case Data Management** page from search
2. **Generate Test Data**:
   - Click "Generate Test Data" button
   - System creates 75 dummy records
   - Progress dialog shows generation status
   - Statistics automatically refresh
3. **View Generated Data**:
   - Click "View Cases" to see all records
   - Use filter actions to view old vs. recent cases
   - Verify completion dates and amounts
4. **Archive Old Cases**:
   - Click "Archive Old Cases" button
   - System calculates 3-year cutoff date
   - Archives all cases older than cutoff
   - Deletes archived records from table
   - Shows success message
5. **Verify Archive**:
   - Search for "Data Archive List" page
   - View archived records by name (e.g., "Case Archive (50 records before 11/03/2022)")
   - Export archived data if needed

### Archive Process Details

The archiving process uses the **SaveRecords() pattern**, which is the most reliable method:

1. Calculate cutoff date: `CalcDate('<-3Y>', Today())`
2. Create archive with descriptive name
3. Filter old records: `SetFilter("Completion Date", '<%1', CutoffDate)`
4. Convert to RecordRef: `RecRef.GetTable(OldCase)`
5. **Save records BEFORE deletion**: `DataArchive.SaveRecords(RecRef)`
6. Delete filtered records: `OldCase.DeleteAll(true)`
7. Save the archive: `DataArchive.Save()`

**Why SaveRecords() is most reliable:**
- Explicitly saves filtered records to JSON cache
- Works BEFORE deletion occurs
- No dependency on database events
- Guaranteed to capture all filtered records

### Technical Implementation Patterns

**Data Generation:**
- Random date calculations using `CalcDate()` with dynamic year/month offsets
- Smart customer assignment from existing Customer table
- Prefixed project numbers (OLD/CUR) for easy identification
- Progress tracking with percentage updates
- Cleanup of existing test data before seeding

**Archive Naming Convention:**
- Uses AL Label for localization support
- Format: `'Case Archive (%1 records before %2)'`
- Dynamic substitution with `StrSubstNo()`
- Example result: "Case Archive (50 records before 11/03/2022)"
- Under 80 characters for UI compatibility

**RecordRef Pattern:**
- Efficient bulk operations without looping
- Table-agnostic archiving approach
- Single method call archives all filtered records
- Memory-efficient for large datasets

## 🛠️ Technical Details

- **Object ID Range**: 50100-50102
- **Platform Version**: 1.0.0.0
- **Application Version**: 26.0.0.0 or later
- **Runtime Version**: 15.0
- **Required Extension**: System Application (for Data Archive codeunit)
- **Features**: NoImplicitWith, TranslationFile
- Uses RecordRef for bulk operations
- Implements SaveRecords() pattern for reliable archiving
- TextBuilder for efficient string concatenation
- Progress dialogs for user feedback
- Label-based localization support

### Key Code Patterns

**Archive Implementation (SaveRecords Pattern):**
```al
procedure CleanupOldCases()
var
    OldCase: Record "Case";
    DataArchive: Codeunit "Data Archive";
    RecRef: RecordRef;
    CutoffDate: Date;
begin
    // Calculate cutoff date
    CutoffDate := CalcDate('<-3Y>', Today());
    
    // Create archive with descriptive name
    DataArchive.Create('Old Cases Cleanup');
    
    // Filter records to archive
    OldCase.SetFilter("Completion Date", '<%1', CutoffDate);
    
    // Save records BEFORE deletion
    RecRef.GetTable(OldCase);
    DataArchive.SaveRecords(RecRef);
    
    // Delete and save archive
    OldCase.DeleteAll(true);
    DataArchive.Save();
end;
```

**Test Data Generation:**
```al
procedure GenerateOldCompletionDate(): Date
var
    YearsAgo: Integer;
    MonthsOffset: Integer;
begin
    // 3-5 years ago with random month offset
    YearsAgo := 3 + Random(3);
    MonthsOffset := Random(12);
    exit(CalcDate('<-' + Format(YearsAgo) + 'Y-' + Format(MonthsOffset) + 'M>', Today()));
end;
```

**UI with TextBuilder:**
```al
local procedure SetInfoText()
var
    TextBuilder: TextBuilder;
begin
    TextBuilder.AppendLine('This page helps you manage Case data...');
    TextBuilder.AppendLine();
    TextBuilder.AppendLine('1. Generate Test Data: Creates dummy records...');
    InfoText := TextBuilder.ToText();
end;
```

## 📦 Installation

### Prerequisites
- Microsoft Dynamics 365 Business Central (Version 26.0 or later)
- AL Development Environment (VS Code with AL Language extension)
- **System Application extension** (contains Data Archive codeunit)
- Data Archive extension enabled in Business Central

### Deployment Steps
1. Clone or download this repository
2. Open the project in Visual Studio Code with AL Language extension
3. Ensure System Application dependency is configured in `app.json`
4. Compile and publish the extension to your Business Central environment:
   ```powershell
   # Using AL:Go or manual publish
   Publish-NavApp -ServerInstance BC -Path "YourApp.app" -SkipVerification
   ```
5. Install the extension in your Business Central tenant
6. Search for "Case Data Management" page to get started

### Verification
After installation:
1. Search for "Case Data Management" in Business Central
2. Click "Generate Test Data" to create sample records
3. Click "View Cases" to verify data generation
4. Click "Archive Old Cases" to test archive functionality
5. Search for "Data Archive List" to view archived data

## 🎯 Use Cases

- **AL Developers** learning Data Archive implementation and best practices
- **Data Retention Policies** implementing automated old record cleanup
- **Compliance Requirements** archiving historical data before deletion
- **Database Performance** removing old records while preserving data
- **Testing Archive Functionality** using realistic test data generation
- **Training Scenarios** demonstrating data lifecycle management
- **RecordRef Pattern Examples** learning bulk operations without looping
- **Educational Purposes** understanding BC archive capabilities
- **Production Archive Solutions** implementing custom archive workflows
- **Audit Trail Management** preserving deleted record history

### Real-World Applications
- Archive completed projects older than retention period
- Clean up old sales orders while preserving history
- Manage customer cases with defined retention policies
- Implement GDPR-compliant data deletion with archival
- Performance optimization for large transactional tables

## 📝 Version History

- **1.0.0.0** (November 2025): Initial release
  - Data Archive functionality implementation
  - SaveRecords() pattern for reliable archiving
  - Case Data Seeder with 75 test records
  - Case Data Management administrative page
  - Case List page with filtering
  - Professional archive naming convention
  - TextBuilder UI implementation
  - Progress tracking and statistics
  - 3-year cutoff date calculation
  - RecordRef bulk operations

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

## � Troubleshooting

### Archive Shows "0 records"
**Problem**: Data Archive shows 0 tables/records after running archive.

**Solution**: This extension uses the **SaveRecords() pattern** which is most reliable:
- Always call `SaveRecords()` BEFORE `DeleteAll()`
- Use RecordRef to pass filtered records
- Avoid `StartSubscriptionToDelete()` which can fail due to event binding issues

### Test Data Not Appearing
**Problem**: Generate Test Data completes but no records visible.

**Solution**:
- Check if records have OLD or CUR prefix in Project No.
- Verify Customer table has existing customers
- Check Case table permissions
- Run "Refresh Statistics" on management page

### Cannot Find Management Page
**Problem**: Case Data Management page not accessible.

**Solution**:
- Search for "Case Data Management" in BC search
- Check extension is installed and published
- Verify UsageCategory = Tasks in page definition

## �📚 Additional Resources

- [Microsoft AL Language Documentation](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-programming-in-al)
- [Data Archive Codeunit Reference](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/dataarchive/dataarchive-data-type)
- [RecordRef Data Type](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/recordref/recordref-data-type)
- [CalcDate Function](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/system/system-calcdate-method)
- [TextBuilder Data Type](https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/textbuilder/textbuilder-data-type)
- [Microsoft BCApps Repository](https://github.com/microsoft/BCApps) - Source code for Data Archive Provider

## 🌟 Key Learnings

This project demonstrates several important AL development concepts:

1. **SaveRecords() is Most Reliable**: Unlike subscription-based approaches, explicitly saving records before deletion guarantees archival
2. **RecordRef for Bulk Operations**: Efficient pattern for handling multiple records without looping
3. **Professional Archive Naming**: Include record counts and dates for searchability
4. **Test Data Design**: Prefix test data for easy identification and cleanup
5. **Progress Feedback**: Keep users informed during long operations
6. **TextBuilder for UI**: More efficient than string concatenation
7. **CalcDate Flexibility**: Powerful for date calculations with dynamic offsets

---

**Happy Coding! 🚀**

*This project demonstrates Data Archive functionality implementation and data lifecycle management in Microsoft Dynamics 365 Business Central.*
