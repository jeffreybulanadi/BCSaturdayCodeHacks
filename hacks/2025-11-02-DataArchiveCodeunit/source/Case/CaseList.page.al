/// <summary>
/// List page for viewing and managing Case records.
/// Shows all case data with filtering and sorting capabilities.
/// </summary>
page 50102 "Case List"
{
    ApplicationArea = All;
    Caption = 'Cases';
    PageType = List;
    SourceTable = "Case";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Cases)
            {
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the project number for this case.';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number for this case.';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name for this case.';
                }

                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when this case was completed.';
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount for this case.';
                }

                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID for this case record.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DataManagement)
            {
                ApplicationArea = All;
                Caption = 'Data Management';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Opens the Case Data Management page for seeding and archiving operations.';

                trigger OnAction()
                var
                    CaseDataMgmt: Page "Case Data Management";
                begin
                    CaseDataMgmt.Run();
                end;
            }
        }

        area(Navigation)
        {
            action(ShowOldCases)
            {
                ApplicationArea = All;
                Caption = 'Show Old Cases';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Filters to show only cases older than 3 years that can be archived.';

                trigger OnAction()
                var
                    CutoffDate: Date;
                begin
                    CutoffDate := CalcDate('<-3Y>', Today());
                    Rec.SetFilter("Completion Date", '<%1', CutoffDate);
                    CurrPage.Update(false);
                end;
            }

            action(ShowRecentCases)
            {
                ApplicationArea = All;
                Caption = 'Show Recent Cases';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Filters to show only recent cases that should not be archived.';

                trigger OnAction()
                var
                    CutoffDate: Date;
                begin
                    CutoffDate := CalcDate('<-3Y>', Today());
                    Rec.SetFilter("Completion Date", '>=%1', CutoffDate);
                    CurrPage.Update(false);
                end;
            }

            action(ShowAllCases)
            {
                ApplicationArea = All;
                Caption = 'Show All Cases';
                Image = ClearFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Removes all filters to show all case records.';

                trigger OnAction()
                begin
                    Rec.SetRange("Completion Date");
                    CurrPage.Update(false);
                end;
            }
        }
    }
}