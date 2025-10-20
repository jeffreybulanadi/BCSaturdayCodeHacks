# Your Azure AD tenant ID
$tenantId = ""

# Your application's client ID
$clientId = ""

# Your application's client secret
$clientSecret = ""
$scope = "https://api.businesscentral.dynamics.com/.default"

$body = @{
    grant_type    = "client_credentials"
    client_id     = $clientId
    client_secret = $clientSecret
    scope         = $scope
}

$response = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -Body $body -ContentType "application/x-www-form-urlencoded"
$accessToken = $response.access_token

Write-Host $accessToken