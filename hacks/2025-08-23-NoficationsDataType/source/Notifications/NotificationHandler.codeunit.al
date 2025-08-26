codeunit 50111 "JB Notification Handler"
{
    procedure ActivateLicense(MyNotification: Notification)
    begin
        Message('Activate License action triggered');
    end;

    procedure RemindLater(MyNotification: Notification)
    begin
        Message('Remind Later action triggered');
    end;

    procedure DismissNotification(MyNotification: Notification)
    begin
        Message('Dismiss Notification action triggered');
    end;
}