codeunit 50100 "JB Event Subscriber"
{

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnOpenPageEvent', '', false, false)]
    local procedure PageCustomerCardOnOpenPageEvent(var Rec: Record Customer)
    begin
        ShowCustomerRecordId(Rec);
    end;

    local procedure ShowCustomerRecordId(var Customer: Record Customer)
    var
        RecID: RecordId;
        RecRef: RecordRef;
        TestCard: Page "Customer Card";
        ErrorInfo2: ErrorInfo;
        OAuth2: Codeunit "OAuth 2.0 Mgt.";
    begin
        RecID := Customer.RecordId;
        RecRef := RecID.GetRecord();
        // TestCard.SetRecord(RecID);

        // RecID.GetRecord();
        // RecID.TableNo();

        // RecID := ErrorInfo2.RecordId

        Customer.Get(RecID);
        TestCard.SetRecord(Customer);
        // Page.Run();

        // OAuth2.

        // Message('Record ID is: %1', Format(RecID));
    end;
}