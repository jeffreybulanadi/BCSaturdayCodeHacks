codeunit 50107 "JB Event Handler"
{
    procedure HandleCodeunitRoleCenterNotificationMgtOnBeforeShowNotifications()
    begin
        InvokeDemoCustomerSetup();
    end;

    local procedure InvokeDemoCustomerSetup()
    var
        Customer: Record Customer;
        ConfirmMgt: Codeunit "Confirm Management";
        i: Integer;
        OpenNewCustomerQst: Label '%1 New customers created. Do you want to open customer card?', Comment = '%1 - No. of new customer';
        CustomerNames: List of [Text[100]];
        CustomerName: Text[100];
    begin
        CustomerNames.Add('Isshin Ashina');
        CustomerNames.Add('Aden Pierce');
        CustomerNames.Add('Jeffrey Bulanadi');
        CustomerNames.Add('Taylor NotTooWell');
        CustomerNames.Add('Mr. P Sherman');
        CustomerNames.Add('John Doe');
        CustomerNames.Add('Juan Lazy');
        CustomerNames.Add('Mad Afaka');

        foreach CustomerName in CustomerNames do
            if SetupDemoCustomer(GenerateCustomerNo(), CustomerName) then
                i += 1;

        // Keeping it simple for now—don’t want to spoil the magic of our next #BCSaturdayCodeHacks
        GetDemoCustomers(Customer);
        if i > 0 then
            if ConfirmMgt.GetResponseOrDefault(StrSubstNo(OpenNewCustomerQst, i), true) then
                Page.Run(Page::"Customer List", Customer);
    end;

    procedure GenerateCustomerNo(): Code[20]
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesReceivablesSetup.GetRecordOnce();
        SalesReceivablesSetup.TestField("Customer Nos.");
        exit(NoSeries.GetNextNo(SalesReceivablesSetup."Customer Nos."));
    end;

    local procedure GetDemoCustomers(var Customer: Record Customer)
    begin
        Customer.SetRange("Is Demo", true);
    end;

    local procedure SetupDemoCustomer(CustomerNo: Code[20]; CustName: Text[100]): Boolean
    var
        Customer: Record Customer;
    begin
        Customer.Init();
        Customer."No." := CustomerNo;
        Customer.Name := CustName;
        Customer."Is Demo" := true;
        exit(Customer.Insert(true));
    end;
}