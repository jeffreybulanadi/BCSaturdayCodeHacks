table 50100 "Case"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            Editable = false;
            AutoIncrement = true;
        }
        field(2; "Project No."; Code[20])
        {
            TableRelation = Job;
        }
        field(3; "Customer No."; Code[20])
        {
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Customer No." <> '' then
                    if Customer.Get("Customer No.") then
                        "Customer Name" := Customer.Name;
            end;
        }
        field(4; "Customer Name"; Text[100]) { }
        field(5; "Completion Date"; Date) { }
        field(6; "Total Amount"; Decimal) { }
    }

    keys
    {
        key(PK; "Project No.")
        {
            Clustered = true;
        }
    }
}