codeunit 50110 "JB Notification Mgt."
{
    procedure SendLicenseActivationReminder()
    var
        UserNotification: Notification;
        // Keeping the magic of #BCSaturdayCodeHacks alive
        // No LEGO spoilers yet—some bricks are still enchanted
        AppInstalledLbl: Label 'Our Not So Booooooring App has been installed. Would you like to activate it?';
        ActivateNowLbl: Label 'Activate now';
        RemindMeLaterLbl: Label 'Remind me in 10 billion days';
        SuppressNotificationLbl: Label 'Don''t show this again';
    begin
        UserNotification.Message(AppInstalledLbl);
        UserNotification.Scope := NotificationScope::LocalScope;

        UserNotification.AddAction(ActivateNowLbl, Codeunit::"JB Notification Handler", 'ActivateLicense');
        UserNotification.AddAction(RemindMeLaterLbl, Codeunit::"JB Notification Handler", 'RemindLater');
        UserNotification.AddAction(SuppressNotificationLbl, Codeunit::"JB Notification Handler", 'DismissNotification');

        UserNotification.Send();
    end;
}