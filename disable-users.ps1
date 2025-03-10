# this script is to disable the inactive users based on the csv from filter-users script
# Reads csv and iterates through each user
# Disables users (replacing with actual Azure AD command)
# Logs actions for tracking and compliance


# defining path of csv for powershell
$csvPath = "inactive_users_report.csv"


# check if file exists - input validation
if (-Not (Test-Path $csvPath)){
    Write-Host "Error: File $csvPath not found."
    exit
}

# Reading CSV file
$inactiveUsers = Import-Alias -Path $csvPath

# Log file for tracking/compliance
$logPath = "disable_users_log.txt"
Add-Content -Path $logPath -Value "Disabling Inactive Users Log"


foreach ($user in $inactiveUsers){
    $userName = $user.UserName

    Write-Host "Disabling user: $userName"

    # example (uncomment below when running in a live Azure env)
    # Disable-AzureADUser - ObjectID $userName

    # Adding action to log file for tracking
    Add-Content -Path $logPath -Value "[$(Get-Date)] Disabled User: $userName"
}

Write-Host "Disable Process Completed. Actions logged in $logPath."