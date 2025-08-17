tableextension 50106 "JB Customer" extends Customer
{
    fields
    {
        field(50106; "Is Demo"; Boolean)
        {
            Caption = 'Is Demo';
            DataClassification = SystemMetadata;
            Editable = false;
        }
    }
}