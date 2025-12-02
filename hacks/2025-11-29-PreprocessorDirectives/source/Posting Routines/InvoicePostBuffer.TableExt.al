#if not CLEAN26
tableextension 50100 "Invoice Post. Buffer" extends "Invoice Post. Buffer"
{
    fields
    {
        field(50100; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = CustomerContent;
        }
    }
}
#endif