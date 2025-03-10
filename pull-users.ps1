# script simulating azure data retrieval 
# script is implied to be running an azure cloud shell with simulated data
# Get-AzureADUserSignInActivity is called implicitly to pull data
# replace with Azure AD commands when access to live server granted

Import-Module Az
Connect-AzAccount

# fetching users from Azure based on simulated login data 
# simulated dataset "pulled" from Azure with user info and lastlogin
$Users = @(
    [userObject]@{ UserName = 'user1@company.com'; LastLogin = '2023-12-01'},
    [userObject]@{ UserName = 'user1@company.com'; LastLogin = '2024-01-14'},
    [userObject]@{ UserName = 'user1@company.com'; LastLogin = '2024-02-14'}
)

# Exporting users array/list to CSV file locally 
# in practice we would assume this would be saved to the cloud instance
# set path to variable to easily modify path if needed
$csvPath = "C:\Desktop\users_login_log.csv"
$Users | Export-Csv -Path $csvPath -NoTypeInformation #no extra metadata

Write-Host "Inactive users exported to $csvPath" 