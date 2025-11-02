/// <summary>
/// Data seeder for Case table to generate test data for archive functionality.
/// Creates dummy records with completion dates from 3+ years ago and recent dates.
/// </summary>
/// <remarks>
/// This codeunit generates realistic test data including:
/// - Old cases (3-5 years ago) for archive testing
/// - Recent cases (last 6 months) for current data
/// - Random customer assignments and amounts
/// Use SeedCaseData() to populate the table with test records.
/// </remarks>
codeunit 50101 "Case Data Seeder"
{
    /// <summary>
    /// Seeds the Case table with dummy data for testing archive functionality.
    /// Creates both old records (3+ years ago) and current records.
    /// </summary>
    /// <remarks>
    /// Generates:
    /// - 50 old cases (3-5 years old) for archive testing
    /// - 25 recent cases (last 6 months) for current data
    /// Progress is shown to the user during generation.
    /// </remarks>
    /// <example>
    /// Call from a page action or test:
    /// <code>
    /// CaseSeeder: Codeunit "Case Data Seeder";
    /// CaseSeeder.SeedCaseData();
    /// </code>
    /// </example>
    procedure SeedCaseData()
    var
        ProgressDialog: Dialog;
        CurrentRecordsGenerated: Integer;
        OldRecordsGenerated: Integer;
        TotalRecords: Integer;
    begin
        // Confirm before seeding
        if not Confirm('This will generate dummy Case records for testing archive functionality.\Do you want to continue?') then
            exit;

        // Clear existing test data
        ClearExistingTestData();

        // Initialize progress
        TotalRecords := GetOldRecordCount() + GetCurrentRecordCount();
        ProgressDialog.Open('Generating test data...\Progress: #1######');

        // Generate old records (3+ years ago)
        OldRecordsGenerated := GenerateOldCases(ProgressDialog, 0, TotalRecords);

        // Generate current records
        CurrentRecordsGenerated := GenerateCurrentCases(ProgressDialog, OldRecordsGenerated, TotalRecords);

        ProgressDialog.Close();

        // Show completion message
        Message('Case data seeding completed!\Old records: %1\Current records: %2\Total records: %3',
            OldRecordsGenerated, CurrentRecordsGenerated, OldRecordsGenerated + CurrentRecordsGenerated);
    end;

    /// <summary>
    /// Generates old Case records with completion dates from 3-5 years ago.
    /// These records are designed to be archived by the archive functionality.
    /// </summary>
    local procedure GenerateOldCases(var ProgressDialog: Dialog; StartProgress: Integer; TotalRecords: Integer): Integer
    var
        NewCase: Record "Case";
        CompletionDate: Date;
        ProgressPercentage: Decimal;
        Counter: Integer;
        OldRecordCount: Integer;
    begin
        OldRecordCount := GetOldRecordCount();

        for Counter := 1 to OldRecordCount do begin
            Clear(NewCase);
            NewCase.Init();

            // Generate project number with old prefix
            NewCase."Project No." := GenerateProjectNumber('OLD', Counter);

            // Set customer data
            SetRandomCustomer(NewCase);

            // Set completion date 3-5 years ago
            CompletionDate := GenerateOldCompletionDate();
            NewCase."Completion Date" := CompletionDate;

            // Generate amount based on old timeframe
            NewCase."Total Amount" := GenerateAmount(false);

            NewCase.Insert();

            // Update progress
            ProgressPercentage := Round((StartProgress + Counter) / TotalRecords * 100, 1);
            ProgressDialog.Update(1, Format(ProgressPercentage) + '% - Old Cases');
        end;

        exit(OldRecordCount);
    end;

    /// <summary>
    /// Generates current Case records with recent completion dates.
    /// These records represent active/recent work that should not be archived.
    /// </summary>
    local procedure GenerateCurrentCases(var ProgressDialog: Dialog; StartProgress: Integer; TotalRecords: Integer): Integer
    var
        NewCase: Record "Case";
        CompletionDate: Date;
        ProgressPercentage: Decimal;
        Counter: Integer;
        CurrentRecordCount: Integer;
    begin
        CurrentRecordCount := GetCurrentRecordCount();

        for Counter := 1 to CurrentRecordCount do begin
            Clear(NewCase);
            NewCase.Init();

            // Generate project number with current prefix
            NewCase."Project No." := GenerateProjectNumber('CUR', Counter);

            // Set customer data
            SetRandomCustomer(NewCase);

            // Set recent completion date
            CompletionDate := GenerateCurrentCompletionDate();
            NewCase."Completion Date" := CompletionDate;

            // Generate amount based on current timeframe
            NewCase."Total Amount" := GenerateAmount(true);

            NewCase.Insert();

            // Update progress
            ProgressPercentage := Round((StartProgress + Counter) / TotalRecords * 100, 1);
            ProgressDialog.Update(1, Format(ProgressPercentage) + '% - Current Cases');
        end;

        exit(CurrentRecordCount);
    end;

    /// <summary>
    /// Sets random customer data for a Case record.
    /// Uses existing Customer records if available, otherwise creates demo customers.
    /// </summary>
    local procedure SetRandomCustomer(var CaseRec: Record "Case")
    var
        Customer: Record Customer;
        CustomerNo: Code[20];
        RandomNumber: Integer;
    begin
        // Try to get existing customers first
        Customer.Reset();
        if Customer.FindSet() then begin
            // Get random customer from existing ones
            RandomNumber := Random(Customer.Count());
            Customer.Next(RandomNumber);
            CustomerNo := Customer."No.";
        end else
            // Create demo customer numbers if none exist
            CustomerNo := GenerateDemoCustomerNo();

        CaseRec."Customer No." := CustomerNo;
        CaseRec.Validate("Customer No.");
    end;

    /// <summary>
    /// Generates a demo customer number for testing when no customers exist.
    /// </summary>
    local procedure GenerateDemoCustomerNo(): Code[20]
    var
        CustomerNumbers: array[10] of Code[20];
        RandomIndex: Integer;
    begin
        // Demo customer numbers
        CustomerNumbers[1] := 'CUST001';
        CustomerNumbers[2] := 'CUST002';
        CustomerNumbers[3] := 'CUST003';
        CustomerNumbers[4] := 'CUST004';
        CustomerNumbers[5] := 'CUST005';
        CustomerNumbers[6] := 'CUST006';
        CustomerNumbers[7] := 'CUST007';
        CustomerNumbers[8] := 'CUST008';
        CustomerNumbers[9] := 'CUST009';
        CustomerNumbers[10] := 'CUST010';

        RandomIndex := Random(10) + 1;
        exit(CustomerNumbers[RandomIndex]);
    end;

    /// <summary>
    /// Generates a project number using prefix and counter.
    /// </summary>
    local procedure GenerateProjectNumber(Prefix: Code[3]; Counter: Integer): Code[20]
    begin
        exit(CopyStr(Prefix + Format(Counter, 0, '<Integer,4><Filler Character,0>'), 1, 20));
    end;

    /// <summary>
    /// Generates completion dates from 3-5 years ago for old records.
    /// </summary>
    local procedure GenerateOldCompletionDate(): Date
    var
        BaseDate: Date;
        MonthsOffset: Integer;
        YearsAgo: Integer;
    begin
        // Random years between 3-5 years ago
        YearsAgo := 3 + Random(3);

        // Random month offset (0-11 months)
        MonthsOffset := Random(12);

        BaseDate := CalcDate('<-' + Format(YearsAgo) + 'Y-' + Format(MonthsOffset) + 'M>', Today());

        // Add random days within the month
        exit(CalcDate('<+' + Format(Random(28)) + 'D>', BaseDate));
    end;

    /// <summary>
    /// Generates completion dates from the last 6 months for current records.
    /// </summary>
    local procedure GenerateCurrentCompletionDate(): Date
    var
        BaseDate: Date;
        DaysOffset: Integer;
        MonthsAgo: Integer;
    begin
        // Random months between 0-6 months ago
        MonthsAgo := Random(7);

        // Random days within the month
        DaysOffset := Random(30);

        BaseDate := CalcDate('<-' + Format(MonthsAgo) + 'M>', Today());

        exit(CalcDate('<-' + Format(DaysOffset) + 'D>', BaseDate));
    end;

    /// <summary>
    /// Generates random amounts based on whether it's current or old data.
    /// </summary>
    local procedure GenerateAmount(IsCurrent: Boolean): Decimal
    var
        BaseAmount: Decimal;
        RandomFactor: Decimal;
    begin
        if IsCurrent then
            BaseAmount := 5000 + Random(50000)  // Current: 5K-55K
        else
            BaseAmount := 1000 + Random(25000); // Old: 1K-26K

        // Add random cents
        RandomFactor := Random(100) / 100;

        exit(BaseAmount + RandomFactor);
    end;

    /// <summary>
    /// Clears existing test data before seeding new data.
    /// Only removes records with test prefixes to avoid deleting real data.
    /// </summary>
    local procedure ClearExistingTestData()
    var
        ExistingCase: Record "Case";
    begin
        // Only clear test data (records with OLD or CUR prefix)
        ExistingCase.SetFilter("Project No.", 'OLD*|CUR*');
        if not ExistingCase.IsEmpty then
            ExistingCase.DeleteAll();
    end;

    /// <summary>
    /// Returns the number of old records to generate.
    /// </summary>
    local procedure GetOldRecordCount(): Integer
    begin
        exit(50); // Generate 50 old records
    end;

    /// <summary>
    /// Returns the number of current records to generate.
    /// </summary>
    local procedure GetCurrentRecordCount(): Integer
    begin
        exit(25); // Generate 25 current records
    end;
}