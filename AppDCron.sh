#!/bin/bash
. /project/resource/controller.cfg

# cd to dir
cd /project/resource/AppDLicenseReports/AppDLicenseCount/

# run java apps for both controllers
java -cp "execLib/*" org.appdynamics.licensecount.CountLicenses -c$controller_prod -P443 -u$user_prod -p$pass_prod -a$account_prod -s -i2 -n
java -cp "execLib/*" org.appdynamics.licensecount.CountLicenses -c$controller_test -P443 -u$user_test -p$pass_test -a$account_test -s -i2 -n

# set date var
d=$(date +%m-%d-%y)

# Copy and rename the files
cp /project/resource/AppDLicenseReports/AppDLicenseCount/quicken_LicenseCount.xlsx /project/resource/reports/Prod_$d.xlsx
cp /project/resource/AppDLicenseReports/AppDLicenseCount/quickentest_LicenseCount.xlsx /project/resource/reports/Test_$d.xlsx
