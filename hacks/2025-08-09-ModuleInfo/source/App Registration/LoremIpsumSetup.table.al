table 50104 "JB Lorem Ipsum Setup"
{
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; Registered; Boolean)
        {
            Caption = 'Registered';
        }
        field(3; "Last Updated"; DateTime)
        {
            Caption = 'Last Updated';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}