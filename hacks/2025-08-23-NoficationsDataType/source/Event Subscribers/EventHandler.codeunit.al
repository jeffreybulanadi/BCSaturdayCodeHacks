codeunit 50109 "JB Event Handler"
{
    procedure HandleCodeunitRoleCenterNotificationMgtOnBeforeShowNotifications()
    var
        NotificationMgt: Codeunit "JB Notification Mgt.";
    begin
        NotificationMgt.SendLicenseActivationReminder();
    end;
}