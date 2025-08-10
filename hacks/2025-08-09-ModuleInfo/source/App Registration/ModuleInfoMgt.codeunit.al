codeunit 50104 "JB ModuleInfo Mgt."
{

    procedure GetExtensionAppDetails(var AppInfo: ModuleInfo)
    begin
        NavApp.GetCallerModuleInfo(AppInfo);
    end;

    #region Let's Try an Idea of Registering an App
    procedure UpdateSubscriptionStatus()
    var
        LoremIpsumSetup: Record "JB Lorem Ipsum Setup";
        DoJoLearnTxt: Label 'dojo@learnbeyondbc.com';
        RegisteredSuccessMsg: Label 'You are now registered to use the %1.\\to activate, please reach out to %2', Comment = '%1 - App name, %2 - Contact Info for activation';
        AppInfo: ModuleInfo;
    begin
        LoremIpsumSetup.Get();
        LoremIpsumSetup.Registered := true;
        LoremIpsumSetup."Last Updated" := CreateDateTime(Today, Time);
        LoremIpsumSetup.Modify();

        GetExtensionAppDetails(AppInfo);
        Message(StrSubstNo(RegisteredSuccessMsg, AppInfo.Name, DoJoLearnTxt));
    end;

    procedure GetAppInfo(var AppInfo: ModuleInfo)
    var
        i: Integer;
        DependencyJArr: JsonArray;
        DependencyJObj: JsonObject;
        AppInfoMsg: Label 'App Id: %1\Name: %2\Publisher: %3\Dependencies: %4', Comment = '%1 - App Id, %2 - App Name, %3 - App Publisher, %4 - App Dependencies';
        DependencyInfo: ModuleDependencyInfo;
    begin
        GetExtensionAppDetails(AppInfo);

        for i := 1 to AppInfo.Dependencies.Count() do begin
            Clear(DependencyJObj);
            DependencyInfo := AppInfo.Dependencies.Get(i);
            DependencyJObj.Add('id', DependencyInfo.Id);
            DependencyJObj.Add('name', DependencyInfo.Name);
            DependencyJObj.Add('publisher', DependencyInfo.Publisher);
            DependencyJArr.Add(DependencyJObj);
        end;

        Message(StrSubstNo(AppInfoMsg, AppInfo.Id, AppInfo.Name, AppInfo.Publisher, DependencyJArr));
    end;
    
    #endregion Let's Try an Idea of Registering an App

}