App for SCCM
===================

Built from scratch and created for the Splunk ChallengePost contest, this app primarily addresses common pain points for System Center Configuration Manager administrators and users.

----------

### Key Features

- Status messages with descriptions
- Change Reporting: Insight into what SCCM admins are doing
- Discovery Events: Watch for abnormal patterns
- Endpoint Protection: Get a quick overview of malware events
- Client Health Reporting: Installs, uninstalls, repairs
- Software Installation Tracking: Installs and removals
- Collection Filtering

#### CIM Compliance ####
If using Endpoint Protection, the Malware Attack model will be used.
There's currently partial support for Audit Change for certain status messaages.

#### Index Information ####
This app uses 2 index files. The sccm_status index includes all status messages. Depending on the size of your SCCM environment you may need to tweak the configuration of this index. The sccm index includes all other inventory and discovery information.

#### Eventgen ####
Sample events are included but have not been tested. It *should* work.
 

### Requirements ###

 - Splunk Enterprise 
 - DB Connect App
 - Configuration Manager 2012 R2 (RTM SP1 should work)


### Installation Instructions ###
> Note
> Depending on the size and age of your SCCM environment you may choose to change the frequency of default intervals, enable tail.follow.only in the db-tail input, disable unwanted event collections, or modify the sccm_status retention. Know your SCCM table sizes before proceeding.

1. Install the App for SCCM app and restart Splunk
2. Assign the sccm_user role to the appropriate users
3. Add the database connection to the app
 1. Open the app and navigate to Settings | External Databases
 2. Click New
 3. On the Add New screen, set the name to sccm, fill in the sccm database connection information, and click Save. User a service account with read only permissions on the SCCM database.
4. Append the contents of inputs.conf into dbx\local\inputs.conf file
5. Modify the db-tail database input intervals if needed.
6. Restart Splunk to start collecting data
7. To immediately start using all features of the app, manually run the included collection saved reports

### Road Map
Improve status message reporting
Include more hardware inventory classes
Apply additional CIM models
Application Model Reporting
Software Update Reporting
OS Deployment Reporting
Alerts
Expand eventgen samples
Switch to HTML reports

### Next Steps
Take a week to relax
Run it in my 10k client production environment
Get input from the MyITForum community
Continue improving the app with monthly releases
Test again complex hierarchies (CAS, multiple sites, etc)

### About me
I've been using Configuration Manager since 2001. I'm brand new to Splunk but in the few weeks I've spent working on this project I've fallen in love with the product. I've always enjoyed SCCM, even back when it was "Slow Moving Software." I believe that combining Splunk and SCCM will fundamentally change how SCCM administrators complete their tasks and I'm passionate about seeing it happen.

Thank you for your consideration.