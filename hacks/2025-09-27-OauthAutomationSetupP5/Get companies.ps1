# Your Azure AD tenant ID
$tenantId = ""

# Your application's client ID
$clientId = ""

# Your application's client secret
$clientSecret = ""

# The environment name (e.g., 'DynamicsCommunity')
$environment = ""

$scope = "https://api.businesscentral.dynamics.com/.default"

$body = @{
    grant_type    = "client_credentials"
    client_id     = $clientId
    client_secret = $clientSecret
    scope         = $scope
}

$response = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Body $body -ContentType "application/x-www-form-urlencoded"
$accessToken = $response.access_token

$headers = @{
    Authorization = "Bearer $accessToken"
}

Invoke-RestMethod -Method Get -Uri "https://api.businesscentral.dynamics.com/v2.0/$tenantId/$environment/api/v2.0/companies" -Headers $headers