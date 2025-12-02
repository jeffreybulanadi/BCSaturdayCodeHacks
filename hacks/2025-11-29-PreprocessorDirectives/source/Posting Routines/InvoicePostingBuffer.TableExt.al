tableextension 50101"Invoice Posting Buffer" extends "Invoice Posting Buffer"
{
    fields
    {
        field(50100; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = CustomerContent;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        }
    }
}