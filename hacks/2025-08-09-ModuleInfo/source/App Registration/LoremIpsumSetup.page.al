page 50104 "JB Lorem Ipsum Setup"
{
    ApplicationArea = All;
    Caption = 'Lorem Ipsum Setup';
    Editable = false;
    PageType = Card;
    SourceTable = "JB Lorem Ipsum Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registered field.';
                }
                field("Last Updated"; Rec."Last Updated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Updated field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Register)
            {
                ApplicationArea = All;
                Caption = 'Register';
                Image = Register;
                ToolTip = 'Register the Lorem Ipsum app.';

                trigger OnAction()
                begin
                    TryToRegisterOurNotSoBoringApp();
                end;
            }

            action(GetOurNotSoBoringAppInfo)
            {
                ApplicationArea = All;
                Caption = 'Get App Info';
                Image = InsertAccount;
                ToolTip = 'Get the app information.';

                trigger OnAction()
                var
                    ModuleInfoMgt: Codeunit "JB ModuleInfo Mgt.";
                    AppInfo: ModuleInfo;
                begin
                    ModuleInfoMgt.GetAppInfo(AppInfo);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        OnValidateOnOpenPage();
    end;

    local procedure OnValidateOnOpenPage()
    begin
        if not Rec.IsEmpty then
            exit;

        Rec.Init();
        Rec."Last Updated" := CreateDateTime(Today, Time);
        Rec.Insert();
    end;

    local procedure TryToRegisterOurNotSoBoringApp()
    var
        ModuleInfoMgt: Codeunit "JB ModuleInfo Mgt.";
    begin
        ModuleInfoMgt.UpdateSubscriptionStatus();
    end;
}
