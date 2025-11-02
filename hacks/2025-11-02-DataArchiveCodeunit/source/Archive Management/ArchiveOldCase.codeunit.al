codeunit 50100 "Archive Old Case"
{
    procedure CleanupOldCases()
    var
        OldCase: Record "Case";
        DataArchive: Codeunit "Data Archive";
        RecRef: RecordRef;
        CutoffDate: Date;
    begin
        // Step 1: Calculate the cutoff date (3 years ago)
        CutoffDate := CalcDate('<-3Y>', Today());

        // Step 2: Tell Data Archive "Start taking pictures"
        DataArchive.Create('Old Cases Cleanup');

        // Step 3: Filter the records you want to archive
        OldCase.SetFilter("Completion Date", '<%1', CutoffDate);

        // Step 4: Convert to RecordRef and save ALL matching records at once
        RecRef.GetTable(OldCase);
        DataArchive.SaveRecords(RecRef);

        // Step 5: Now delete them
        OldCase.DeleteAll(true);

        // Step 6: Save the archive
        DataArchive.Save();

        Message('Old cases archived and deleted successfully!');
    end;
}