$webRequest = Invoke-WebRequest -Uri 'http://phc.prontonetworks.com/cgi-bin/authlogin?URI=http://captive.apple.com/hotspot-detect.html' -SessionVariable webSession
Write-Output($webRequest)
Write-Output($webRequest.Forms)
[string]$userName = ''
[string]$userPassword = ''
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)
$loginForm = @{
    userId = $credObject.UserName 
    password = $credObject.GetNetworkCredential().Password
}
$webRequest = Invoke-WebRequest -Uri 'http://phc.prontonetworks.com/cgi-bin/authlogin?URI=http://captive.apple.com/hotspot-detect.html' -Method Post -Body $loginForm -WebSession $webSession

Write-Output($webRequest.Content)
