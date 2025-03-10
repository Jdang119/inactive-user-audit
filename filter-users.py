# script to filter users who have been inactive for 90+ days
# script imports "users_login_log.csv" created from pull-users script
# exporting inactive users to a csv for deactivation
# using CSV module for more efficient file parsing and coding

import csv
from datetime import datetime, timedelta

#opens same csv from pull-users script
with (open('users_login_log.csv', "r")) as file:
    reader = csv.DictReader(file)

    #setting inactivity rule 90 days from runtime of script
    inactivivityRule = datetime.now() - timedelta(days=90)

    #storing inactive users to empty list
    inactive_users = []

    for row in reader:

        last_login_date = datetime.strptime(row['LastLogin'], '%Y-%m-%d')

        if last_login_date < inactivivityRule:
            inactive_users.append(row)


#writing inactive user list to a new csv
with open('inactive_users_report', "w", newline='') as file:
    fieldnames = ['UserName', 'LastLogin']
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerows(inactive_users)

print("Filtered inactive users and saved to inactive_users_report.csv")