codeunit 50101 "JB ChangeCompany Mgt."
{
    procedure SyncGLAccountToSubs(var SourceGL: Record "G/L Account")
    var
        Company: Record Company;
        DestinationGL: Record "G/L Account";
        GLAccountSyncToDestCompanyMsg: Label 'G/L Account synced to %1', Comment = '%1 is the destination company name';
        DestinationCompany: Text[30];
    begin
        Clear(DestinationCompany);
        Company.SetFilter(Name, '<>%1', CompanyName);
        If Page.RunModal(PAGE::Companies, Company) = Action::LookupOK then begin
            DestinationCompany := Company.Name;

            if Company.ChangeCompany(DestinationCompany) then
                DestinationGL.ChangeCompany(DestinationCompany);

            if not DestinationGL.Get(SourceGL."No.") then begin
                DestinationGL.Init();
                DestinationGL.TransferFields(SourceGL);
                DestinationGL.Insert();

                Message(GLAccountSyncToDestCompanyMsg, DestinationCompany);
            end;
        end;
    end;
}