codeunit 50102 "Posting Routines"
{
#if CLEAN26
    // Copy from Purchase Invoice to G/L Entry
    // Updated for BC 26.x - Using new "Invoice Posting Buffer" instead of obsolete "Invoice Post. Buffer"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Post Invoice Events", 'OnAfterPrepareInvoicePostingBuffer', '', true, true)]
    local procedure CodeunitPurchPostInvoiceEventsOnAfterPrepareInvoicePostingBuffer(var InvoicePostingBuffer: Record "Invoice Posting Buffer"; var PurchaseLine: Record "Purchase Line")
    begin
        // Transfer Job Task No. from Purchase Line to new Invoice Posting Buffer
        InvoicePostingBuffer."Job Task No." := PurchaseLine."Job Task No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterCopyToGenJnlLine', '', true, true)]
    local procedure TableInvoicePostingBufferOnAfterCopyToGenJnlLine(InvoicePostingBuffer: Record "Invoice Posting Buffer"; var GenJnlLine: Record "Gen. Journal Line")
    begin
        // Copy from the new Invoice Posting Buffer to Gen. Journal Line, for purchase posting
        GenJnlLine."Job Task No." := InvoicePostingBuffer."Job Task No.";
    end;
#else
    // >> Copy from Purchase Invoice to G/L Entry
    [EventSubscriber(ObjectType::Table, Database::"Invoice Post. Buffer", 'OnAfterInvPostBufferPreparePurchase', '', true, true)]
    local procedure PA_IPB_OnAfterInvPostBufferPreparePurchase(var PurchaseLine: Record "Purchase Line"; var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin'
        InvoicePostBuffer."Job Task No." := PurchaseLine."Job Task No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Invoice Post. Buffer", 'OnAfterCopyToGenJnlLine', '', true, true)]
    local procedure PA_GJL_OnAfterCopyGenJnlLineFromInvPostBuffer(InvoicePostBuffer: Record "Invoice Post. Buffer"; var GenJnlLine: Record "Gen. Journal Line")
    begin
        // Copy from the invoice buffer to the GL, for purchase posting
        GenJnlLine."Job Task No." := InvoicePostBuffer."Job Task No.";
    end;
#endif

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnBeforeInsertGLEntry', '', true, true)]
    local procedure CodeunitGenJnlPostLineOnPostGLAccOnBeforeInsertGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry"; var IsHandled: Boolean)
    begin
        // Copy from the general journal line to the GL Entry, for General Journal posting
        GLEntry."Job Task No." := GenJournalLine."Job Task No.";
    end;

}





