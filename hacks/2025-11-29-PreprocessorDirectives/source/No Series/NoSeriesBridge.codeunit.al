codeunit 50100 "No. Series Bridge"
{
    procedure GetNextProjectNo(NoSeriesCode: Code[20]; PostingDate: Date): Code[20]
    var
#if CLEAN26
        NoSeries: Codeunit "No. Series";
#else
        NoSeries: Codeunit NoSeriesManagement;
#endif
        NextNo: Code[20];
    begin

#if CLEAN26
        // BC27+: Legacy NoSeriesManagement removed. Use "No. Series" codeunit.
        // GetNextNo no longer takes ModifySeries; use PeekNextNo to preview without consuming.
        // Consume and return the next number
        NextNo := NoSeries.GetNextNo(NoSeriesCode, PostingDate);
        exit(NextNo);
#else
        // Legacy path: Use NoSeriesManagement (marked for removal in newer versions).
        // Kept behind a directive and pragma-suppressed to allow gradual refactor.
#pragma warning disable AL0432
            NoSeriesMgt.GetNextNo(NoSeriesCode, PostingDate, true, NextNo);
#pragma warning restore AL0432
        exit(NextNo);
#endif
    end;
}



















