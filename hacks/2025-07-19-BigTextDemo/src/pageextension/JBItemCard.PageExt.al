pageextension 50100 "JB Item Card" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {

            group("JB HTMLDescGroup")
            {
                Caption = 'HTML Description';
                field("JB HTML Description"; HTMLText)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = RichContent;
                    MultiLine = true;
                    ShowCaption = false;

                    trigger OnValidate()
                    begin
                        SaveHTMLToBlob();
                    end;
                }
            }
        }
    }

    actions
    {
        addafter(CopyItem)
        {
            action("JB Import HTML Spec")
            {
                ApplicationArea = All;
                Caption = 'Import HTML Spec';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Import HTML Specification from file.';
                trigger OnAction()
                begin
                    ImportHTMLSpec();
                end;
            }
        }
    }
    var
        HTMLText: BigText;

    trigger OnAfterGetRecord()
    begin
        LoadHTMLFromBlob();
    end;

    local procedure LoadHTMLFromBlob()
    var
        InStr: InStream;
    begin
        Clear(HTMLText);
        if not Rec."HTML Description".HasValue() then
            exit;

        Rec.CalcFields("HTML Description");
        Rec."HTML Description".CreateInStream(InStr, TextEncoding::UTF8);
        HTMLText.Read(InStr); // Stream from Blob → BigText
    end;

    procedure ImportHTMLSpec()
    var
        BigSpec: BigText;
        FileStream: InStream;
        FromFile: Text;
    begin
        if not UploadIntoStream('Select HTML File', '', 'HTML Files (*.html)|*.html|Text Files (*.txt)|*.txt', FromFile, FileStream) then
            exit;

        BigSpec.Read(FileStream);
        HTMLText.AddText(BigSpec);
        SaveHTMLToBlob();
        CurrPage.Update();

        Message('HTML file imported successfully: %1', FromFile);
    end;

    local procedure SaveHTMLToBlob()
    var
        OutStr: OutStream;
    begin
        Rec."HTML Description".CreateOutStream(OutStr, TextEncoding::UTF8);
        HTMLText.Write(OutStr); // Stream BigText → Blob
        Rec.Modify(true);
    end;

    local procedure ShowCustomerRecordId()
    var
        Customer: Record Customer;
        RecID: RecordId;
    begin
        Customer.FindFirst();
        RecID := Customer.RecordId;
        Message('Record ID is: %1', Format(RecID));
    end;
}