/// <summary>
/// Administrative page for Case data management and archive operations.
/// Provides access to data seeding and archive cleanup functionality.
/// </summary>
page 50101 "Case Data Management"
{
    AboutText = 'This page allows administrators to manage Case data for testing archive functionality. It provides options to generate test data and archive old cases.';
    AboutTitle = 'About Case Data Management';
    ApplicationArea = All;
    Caption = 'Case Data Management';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(Information)
            {
                Caption = 'Information';
                ShowCaption = false;

                field(InfoText; InfoText)
                {
                    ApplicationArea = All;
                    Caption = 'Instructions';
                    Editable = false;
                    MultiLine = true;
                    ShowCaption = false;
                    ToolTip = 'Shows instructions for using the data management functions.';
                }
            }
            group(DataManagement)
            {
                Caption = 'Data Management';

                group(Statistics)
                {
                    Caption = 'Current Data Statistics';

                    field(TotalCases; TotalCases)
                    {
                        ApplicationArea = All;
                        Caption = 'Total Cases';
                        Editable = false;
                        ToolTip = 'Shows the total number of case records in the system.';
                    }
                    field(OldCases; OldCases)
                    {
                        ApplicationArea = All;
                        Caption = 'Old Cases (3+ years)';
                        Editable = false;
                        ToolTip = 'Shows the number of cases older than 3 years that can be archived.';
                    }
                    field(RecentCases; RecentCases)
                    {
                        ApplicationArea = All;
                        Caption = 'Recent Cases';
                        Editable = false;
                        ToolTip = 'Shows the number of recent cases that should not be archived.';
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(DataOperations)
            {
                Caption = 'Data Operations';

                action(SeedTestData)
                {
                    ApplicationArea = All;
                    Caption = 'Generate Test Data';
                    Image = NewDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Generates dummy case records for testing archive functionality. Creates both old (3+ years) and recent data.';

                    trigger OnAction()
                    var
                        CaseSeeder: Codeunit "Case Data Seeder";
                    begin
                        CaseSeeder.SeedCaseData();
                        UpdateStatistics();
                    end;
                }
                action(ArchiveOldCases)
                {
                    ApplicationArea = All;
                    Caption = 'Archive Old Cases';
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Archives and deletes case records older than 3 years using the Data Archive functionality.';

                    trigger OnAction()
                    var
                        ArchiveOldCase: Codeunit "Archive Old Case";
                    begin
                        ArchiveOldCase.CleanupOldCases();
                        UpdateStatistics();
                    end;
                }
            }

            group(ViewData)
            {
                Caption = 'View Data';

                action(ViewCases)
                {
                    ApplicationArea = All;
                    Caption = 'View Cases';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    RunObject = Page "Case List";
                    ToolTip = 'Opens the Case list to view all case records.';
                }
                action(RefreshStats)
                {
                    ApplicationArea = All;
                    Caption = 'Refresh Statistics';
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Refreshes the data statistics displayed on this page.';

                    trigger OnAction()
                    begin
                        UpdateStatistics();
                    end;
                }
            }
        }
    }

    var
        InfoText: Text;
        TotalCases: Integer;
        OldCases: Integer;
        RecentCases: Integer;

    trigger OnOpenPage()
    begin
        SetInfoText();
        UpdateStatistics();
    end;

    /// <summary>
    /// Sets the informational text displayed on the page.
    /// </summary>
    local procedure SetInfoText()
    var
        TextBuilder: TextBuilder;
    begin
        TextBuilder.AppendLine('This page helps you manage Case data for testing archive functionality.');
        TextBuilder.AppendLine();
        TextBuilder.AppendLine('1. Generate Test Data: Creates dummy case records with dates ranging from 3-5 years ago and recent dates');
        TextBuilder.AppendLine('2. Archive Old Cases: Uses the Data Archive feature to archive and delete cases older than 3 years.');
        TextBuilder.AppendLine('3. View Cases: Opens the case list to see all records.');
        TextBuilder.AppendLine();
        TextBuilder.Append('Use Generate Test Data first, then Archive Old Cases to test the archive functionality.');

        InfoText := TextBuilder.ToText();
    end;

    /// <summary>
    /// Updates the statistics displayed on the page.
    /// </summary>
    local procedure UpdateStatistics()
    var
        CaseRec: Record "Case";
        CutoffDate: Date;
    begin
        // Calculate cutoff date (3 years ago)
        CutoffDate := CalcDate('<-3Y>', Today());

        // Count total cases
        CaseRec.Reset();
        TotalCases := CaseRec.Count();

        // Count old cases (3+ years)
        CaseRec.Reset();
        CaseRec.SetFilter("Completion Date", '<%1', CutoffDate);
        OldCases := CaseRec.Count();

        // Count recent cases
        CaseRec.Reset();
        CaseRec.SetFilter("Completion Date", '>=%1', CutoffDate);
        RecentCases := CaseRec.Count();

        CurrPage.Update(false);
    end;
}