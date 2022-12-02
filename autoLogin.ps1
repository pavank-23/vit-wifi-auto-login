$credential = Get-Credential
$webRequest = Invoke-WebRequest -Uri 'http://phc.prontonetworks.com/cgi-bin/authlogin'
$loginForm  = $webRequest.Forms[0]
$loginForm.Fields.userId   = $credential.UserName
$loginForm.Fields.password = $credential.GetNetworkCredential().Password

$webRequest = Invoke-WebRequest -Uri $loginForm.Action -Method $loginForm.Method -Body $loginForm.Fields -WebSession $webSession