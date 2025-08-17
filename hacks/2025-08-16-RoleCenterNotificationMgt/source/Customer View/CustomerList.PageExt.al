pageextension 50106 "JB Customer List" extends "Customer List"
{
    layout { }

    actions
    {
        addafter(ApplyTemplate)
        {
            action("JB DeleteSelectedCustomers")
            {
                ApplicationArea = All;
                Caption = 'Deleted Selected Customers';
                Image = DeleteRow;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Deleted Selected Customers action.';

                trigger OnAction()
                begin
                    DeleteSelected(Rec);
                end;
            }
        }
    }

    local procedure DeleteSelected(var Customer: Record Customer)
    var
        CustomerToDelete: Record Customer;
    begin
        CustomerToDelete := Customer;
        CurrPage.SetSelectionFilter(CustomerToDelete);

        CustomerToDelete.DeleteAll(true);
    end;
}