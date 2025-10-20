// page 50102 "JB Find Record Management Demo"
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Documents;
//     Caption = 'Find Record Management Demo';

//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 field("Item Entry No"; ItemEntryNo)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Item Entry No.';
//                     Editable = false;

//                     trigger OnDrillDown()
//                     var
//                         ILE: Record "Item Ledger Entry";
//                     begin
//                         if ItemEntryNo = 0 then
//                             exit;

//                         ILE.SetRange("Entry No.", ItemEntryNo);
//                         Page.Run(Page::"Item Ledger Entries", ILE);
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(FindLastItem)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Find Last Item';
//                 Image = Find;

//                 trigger OnAction()
//                 begin
//                     FindLastItemEntry();
//                 end;
//             }
//         }
//     }

//     var
//         ItemEntryNo: Integer;

//     local procedure FindLastItemEntryUsingFindLast()
//     var
//         ItemLedgerEntry: Record "Item Ledger Entry";
//         Tex1: Text[100];
//         Test123: BigText;
//         Test11: FileUpload;
//     begin
//         ItemEntryNo := 0;
//         if ItemLedgerEntry.FindLast() then
//             ItemEntryNo := ItemLedgerEntry."Entry No.";

//         if ItemEntryNo <> 0 then
//             Message('Last Item Entry: %1', ItemEntryNo)
//         else
//             Message('No item entries found');
//     end;

//     local procedure FindLastItemEntry()
//     var
//         ItemLedgerEntry: Record "Item Ledger Entry";
//         FindRecordMgt: Codeunit "Find Record Management";
//     begin
//         ItemEntryNo := FindRecordMgt.GetLastEntryIntFieldValue(ItemLedgerEntry, ItemLedgerEntry.FieldNo("Entry No."));

//         if ItemEntryNo <> 0 then
//             Message('Last Item Entry: %1', ItemEntryNo)
//         else
//             Message('No item entries found');
//     end;

// }
