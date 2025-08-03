codeunit 50103 "JB Environment Subs."
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnOpenPageEvent', '', false, false)]
    local procedure PageCustomerListOnOpenPageEvent(var Rec: Record Customer)
    var
        EnvironmentMgt: Codeunit "JB Environment Mgt.";
    begin
        if EnvironmentMgt.IsSafeToRunSensitiveLogic() then
            EnvironmentMgt.ShowEnvironmentInfo();
    end;
}