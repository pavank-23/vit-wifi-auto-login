$url = "http://phc.prontonetworks.com/cgi-bin/authlogin"
$formData = @{
    userId = ""
    password = ""
    serviceName = "ProntoAuthentication"
    dynamicMacAuth = "true"
}
$response = Invoke-WebRequest -Uri $url -Method Post -Body $formData
