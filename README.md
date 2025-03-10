# inactive-user-audit

This is a Project to demonstrate powershell & python automation and data structuring in a cybersecurity/IAM environment with simulated Azure/AD .csv files
Simulated environent that automates the process of pulling user login data from azure, filters inactive users/disabling them in Azure AD, then logging all actions with added email alert/reporting upon completed execution of script.

- pull-users.ps1 
    - Powershell script that simulates pulling user data from an Azure AD instance and storing user data and values into a .csv file for parsing and data structuring

- filter-users.py 
    - filters inactive users who have not been active for more than 90 days from the pull-users.ps1 script, then stores those users in another csv file

- disable-users.ps1 
    - simulates disabling user accounts in powershell provided by the filter-users.py script and logs all actions for compliance and tracking



- Future Add-Ons:
    - Automated Email Alert/Reporting 
    - Additional data structure support (JSON)
