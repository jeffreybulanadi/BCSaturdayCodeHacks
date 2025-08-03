codeunit 50102 "JB Environment Mgt."
{
    procedure ShowEnvironmentInfo()
    var
        AzureADTenant: Codeunit "Azure AD Tenant";
        EnvironmentInfo: Codeunit "Environment Information";
        CurrentEnvInfoMsg: Label 'Domain Name: %1 \Tenant Id: %2 \Environment Name: %3 \Is OnPrem: %4 \Is Sandbox: %5 \Is SaaS: %6';
    begin
        Message(
            CurrentEnvInfoMsg,
            AzureADTenant.GetAadTenantDomainName(),
            AzureADTenant.GetAadTenantId(),
            EnvironmentInfo.GetEnvironmentName(),
            EnvironmentInfo.IsOnPrem(),
            EnvironmentInfo.IsSandbox(),
            EnvironmentInfo.IsSaaSInfrastructure()
        );
    end;

    procedure IsSafeToRunSensitiveLogic(): Boolean
    var
        EnvironmentInfo: Codeunit "Environment Information";
    begin
        exit(EnvironmentInfo.IsSandbox());
    end;
}