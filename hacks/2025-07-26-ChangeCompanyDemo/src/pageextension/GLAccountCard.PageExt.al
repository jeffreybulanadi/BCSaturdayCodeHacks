pageextension 50101 "JB G/L Account Card" extends "G/L Account Card"
{
    actions
    {
        addafter("Apply Template")
        {
            action("JB Copy G/L Account")
            {
                ApplicationArea = All;
                Caption = 'Copy G/L Account to Selected Company';
                Image = CopyCostBudget;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ChangeCompanyMgt: Codeunit "JB ChangeCompany Mgt.";
                begin
                    ChangeCompanyMgt.SyncGLAccountToSubs(Rec);
                end;
            }
        }
    }
}