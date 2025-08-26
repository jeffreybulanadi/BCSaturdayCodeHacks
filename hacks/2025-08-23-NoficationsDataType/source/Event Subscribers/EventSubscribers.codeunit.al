codeunit 50108 "JB Event Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Role Center Notification Mgt.", 'OnBeforeShowNotifications', '', false, false)]
    local procedure CodeunitRoleCenterNotificationMgtOnBeforeShowNotifications()
    var
        EventHandler: Codeunit "JB Event Handler";
    begin
        EventHandler.HandleCodeunitRoleCenterNotificationMgtOnBeforeShowNotifications();
    end;
}