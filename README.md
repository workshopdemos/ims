# Getting Started
1. Login to the workshop system using the given URL, username, and password, and follow the steps your instructor provides.

<p align="center">
   <img src=https://github.com/user-attachments/assets/776b9c06-eac1-413a-9989-21b2f1d1ba38>
</p>

2. You are in the secure cloud environment connected to the Mainframe.

<p align="center">
  <img src=https://github.com/user-attachments/assets/ebf7bdd8-0427-4777-9186-181018deeb20>
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/c2533317-4dd9-4402-8f56-f8d88e968ce6">
</p>

3. Make sure the initial build process has been completed successfully (exit code: 0 message in the active terminal)
4. Install c3270 from a terminal using the following command: <code> sudo apt-get install c3270 </code>
5. To run the emulator, use the following command: <code> c3270 ipaddress </code>
6. Login to TPX session using the given mainframe username and password.
7. Select the first z/OS instance from TPX menu. 

# Essential Information for the Workshop
This section provides essential resources for the workshop, including IMS system details, contents of the workshop data set, test database information, and ISPF access information. Use this information in the step procedures that follow.

### IMS Details
```
IMS ID:                               IMSA
IMS PLEX:                             PLEX1
IMS installation HLQ:                 IMSSYS15.*
PROCLIB data set:                     IMSSYS15.PROCLIB
IMS PROCLIB starting option member:   DFSPBIV1
Active IMS PROCLIB DFSDF member:      DFSDF001
Workshop JCL library:	              WORKSHOP.MACB.USER.JCL
```

### Contents of the WORKSHOP.MACB.USER.JCL Data Set
```
Jobs C0* - C99*		Used for migration to IMS-managed ACBs.
ORDGET			Run COBOL application for GET record from ORDRMR database.
ORDUPD			Run COBOL application for UPD record in ORDRMR database.  
ANALYZE			Run Database Analyzer function ANALYZE.
```

### Test Database
```
Data set with source DBD and PSB:              WORKSHOP.MACB.CFG.SRC
Database name:                                 ORDRMR
Database organization:                         HDAM
Batch application that reads the database:     WORKSHOP.MACB.USER.JCL(ORDGET)
Batch application that updates the database:   WORKSHOP.MACB.USER.JCL(ORDUPD)
```

### ISPF Access
To interact with z/OS through ISPF, use the c3270 emulator.
Install c3270 from a terminal using the following command:
```
sudo apt-get install c3270
```
To run the emulator, use the following command:
```
c3270 ipaddress
```

# Get to Know the Workshop Environment
This section guides you through ISPF panels to list available databases and verify that the IMS system is running.
1. Select **SYSVIEW** option on the **ISPF Primary Option Menu** and press **Enter**. The SYSVIEW main menu appears.
2. Use the following commands to access relevant information:
   - To display active IMS systems, type `IMSLIST` in the **Option** field and press **Enter**.

     The list of IMS control regions appears.
   - For a list of jobs, type `ST` in the **Option** field and press **Enter**. The list of jobs and their status appears. Use the following commands to filter results. You can combine these commands to generate specific job lists.
      -  `PRE IMSA*`

         Lists all jobs starting with jobname IMSA* for the current owner.
      -  `OWNER *  `

         Lists jobs for all owners.
3. Use one of the following methods to see which databases are available:
   - **Use IMS DISPLAY Command**
     - Type `L` in the **Cmd** field next to the IMSACTLR job and press **Enter**.

       The list of job data sets appears.
     - Type `S` next to the JESMSGLG DDname and press **Enter**.

       The job output appears
     - Locate the last prompt number in the output.
       ```
       10.56.13 STC15585  DFS058I 10:56:13 ERESTART COMMAND IN PROGRESS   IMSA
       10.56.13 STC15585  *004 DFS996I *IMS READY*  IMSA
       ```
     - Issue an IMS type-1 DISPLAY command:
       ```
       SYSVIEW 17.0 R176 ------- OUTPUT, Job Output ------- 2024/09/03 09:01:43
       Command ====> /r 004,/dis db all.
       ```
       A list of all defined databases in the system is written to JESMSGLG.
   - **Use IMS Single Point of Control**
     - Exit SYSVIEW.
     - Select **Command** option on the **ISPF Primary Option Menu** and press Enter.

       The **ISPF Command Shell** appears.
     - Execute the following TSO command:
       ```
       exec 'imssys15.sdfsexec(dfsspsrt)' 'hlq(imssys15)'
       ```
       The **IMS Single Point of Control** panel appears.
     - Enter the following IMS type-2 QUERY command in the **Command** field and specify the IMSplex in the **Plex** field.
       ```
       qry db name(ordrmr) show(all) 
       ```
       Press **Enter**.

       A list of all defined databases in the system appears.

You have verified that the IMS system is up and running. You can now proceed with the analysis of the test database.

# Validate and Verify Database Functionality
Perform the steps needed to analyze the test database.
1. ### Stop the Database ###
   Execute one of the following IMS commands to stop the database:
   ```
   /DBR DB ORDRMR
   ```
   or
   ```
   UPDATE DB NAME(ORDRMR) STOP(ACCESS)
   ```
2. ### Validate Database Status ###
   Issue the IMS QUERY command to verify that the database is stopped.
   ```
    Response for: QRY DB NAME(ORDRMR) SHOW(ALL)          
   DBName   MbrName    CC TYPE     LAcc LRsdnt LclStat  
   ORDRMR   IMSA        0 DL/I     UPD  N      NOTOPEN
   ```
3. ### Analyze the Database ###
   To analyze the test database using Database Analyzer, submit the JCL that is prepared in WORKSHOP.MACB.JCL(ANALYZE) and does not need to be updated. The output is generated.
4. ### Review Analysis Output ###
   Browse the DBARPTS section in the job output for information about the test database.
   ```
   DATA BASE RECORD STATISTICS
   ___________________________
     # OF DB RECORDS       :            1
     # OF SEGMENTS         :            2
     AVG # SEGMENTS/RECORD :          2.0
     AVG # BYTES/RECORD    :         60.0
   ```
5. ### Retrieve Database Records ###
   (Optional) To check the contents of the database, edit the JCL for record retrieval, located in WORKSHOP.MACB.JCL(ORDGET).
   - If the database is online, uncomment the EXEC statement for the BMP region.
   - If the database is offline, ensure that DBDLIB and PSBLIB data sets are allocated in IMS DD, and use the DLI version of EXEC.
   
   Submit the JCL.

   The output of the sample COBOL application is stored in SYSOUT.
   ```
    Id: 0000000001 Order Id: 0000010900
    Id: 0000000001 Name: RADEK MRVEC
   ```
7. ### Update and Compare ###
   (Optional) Run the JCL ORDUPD and observe changes in the database behavior after the execution of the update job

You have successfully analyzed the database and tested that you can perform updates on it. You can now prepare the IMS catalog for transition to an IMS-managed ACBs environment.

# Prepare IMS Catalog and Directory #
Perform the steps needed to set up the IMS catalog and directory. Step 1 creates a DFSDF proclib member, while other steps execute jobs to complete the preparation process.
1. ### Create DFSDF PROCLIB Member ###
   Create a copy of an active DFSDF member and add the CATALOG section to the copied member as follows:
   ```
   <SECTION=CATALOG>
   CATALOG=NO
   ALIAS=DFSC
   STORCLAS=DEFAULT
   DATACLAS=DEFAULT
   MGMTCLAS=DEFAULT
   RETENTION=(DAYS=40,VERSIONS=55)
   ACBMGMT=ACBLIB 
   ```
2. ### Obtain IMS Catalog DBDs and PSBs - JCL(C0COPY) ###
   Update SYSIN DD with the IMS catalog DBD and PSB members from IMS RESLIB.
   
   The following DBD members are available:
    - DFSCD000
    - DFSCX000

   The following PSB members are available:
    - DFSCPL00 (Performing an initial load of the IMS catalog)
    - DFSCP000 (Estimating the space requirements of the IMS catalog data sets)
    - DFSCP001 (Inserting records to an existing IMS catalog)
    - DFSCP002 (Provides read access to the IMS catalog for PL/I programs)
    - DFSCP003 (Provides read access to the IMS catalog for PASCAL programs)
   
   Submit the JCL.
	
   The DBD and PSB members are copied from IMSSYS15.SDFSRESL to working data sets.
3. ### Register IMS Catalog with DBRC - JCL(C1CATREG) ###
   Update SYSIN DD to register both DBD members (DFSCD000 and DFSCX000). Ensure that the partition key strings have one partition for DBDs and one for PSBs. The correct key strings are 16 characters long in the following format:
   ```
	KEYSTRNG('DBD     ZZZZZZZZ') 
	KEYSTRNG('PSB     ZZZZZZZZ')
   ```
   Submit the JCL.
   
	The IMS catalog is registered with DBRC.
4. ### Generate IMS Catalog ACBs - JCL(C2ACBGEN) ###
   Specify the PSB members of your choice in SYSINP DD, and submit the JCL.
	
 	The generated ACBs are stored in the data set WORKSHOP.MACB.ACBLIB.
5. ### Analyze IMS Catalog - JCL(C3CATANA) ###
   Obtain information about the size and status of the initial ACBLIB, which is loaded into the IMS catalog.
   	- In the DFS3PU00 PARM field, specify the PSB members to analyze and the DFSDF member name.
   	- Specify CATALOG=YES in the DFSDF member to enable the IMS catalog.
   	- Specify MANAGEDACBS=SETUP in SYSIN DD.
   	- Submit the JCL.
   
	Use the generated output to calculate the correct size parameters for both partitions.
	```
 	ESTIMATED SPACE REQUIREMENT TO HOLD INSERTED SEGMENTS
      	DSG   BLKSIZE   BLOCKS
      	---   -------   ------
       	A      4096         5
       	B      4096         5
       	C      4096        50
       	D      4096         2

      	DSG   RECORDS
      	---   -------
       	L         0
       	X        14

      	SECONDARY
      	INDEX        RECORDS
      	---------    -------
      	DFSCX000         63
	```
 6. ### Allocate IMS Catalog Datasets - JCL(C4CATALC) ###
    Update the allocation parameters for the IMS catalog database data sets and IDCAMS DEFINE, and submit the JCL.
	 
    The IMS catalog data sets are allocated.
 7. ### Initialize IMS Catalog Database Partitions - JCL(C5CATINI) ###
    Specify DBDNAME for both DBD members in SYSIN DD, and submit the JCL.
	 
  	 The IMS catalog database partitions are initialized.
 8. ### Populate IMS Catalog - JCL(C6CATALD) ###
    Update the JCL with the proper PSB members for the initial load, and submit the JCL.
	 
	 All ACBs from the IMS ACBLIB are populated into the newly created directories, and entries are added to the IMS catalog database.
 9. ### Verify Resources are Synchronized - JCL(C7VERIFY) ###
    Update the CATALOG section of the DFSDF member to enable IMS-managed ACBs.
    ```
    ACBMGMT=CATALOG
    ```
    Update the CATCTRL DD statement with the DFSDF member name and the DBD name that you want to verify. Submit the JCL.
	 
    The output report is generated in the data set that is specified in the CATRPTS DD. Use this report to see if your resource is synchronized across all inputs.
    ```
	 ----- DIRECTORY ------   ------ CATALOG -------    ------ ACBLIB --------
	       TIMESTAMP                TIMESTAMP                 TIMESTAMP
	 ----------------------   ----------------------    ----------------------
	 2024/07/17 08:53:22      2024/07/17 08:53:22.16    2024/07/17 08:53:22
    ```
 10. ### Make an Image Copy of IMS Catalog - JCL(C8ICOPY) ###
     (Recommended) Since the IMS catalog is a HALDB database, we highly recommend that you create an image copy after the initial load. To create an image copy, update DBOCTRL DD with correct DBDNAMES, update the DFSDF control 				statement to use IMS-managed ACBs, and submit the JCL.
	
 	  Image copies of the database and secondary index are created. The DBARPTS output provides detailed information about the IMS catalog database.

You have prepared the IMS catalog and directory for the transition to IMS-managed ACBs. You can now proceed with the transition process.

# Transition to IMS-Managed ACBs #
Perform the steps needed to transition to an IMS-managed ACBs environment. Steps 2 and 3 involve executable jobs to add new resources to the IMS catalog and activate them.
1. ### Restart IMS Control Region ###
   To enable IMS-managed ACBs, restart the IMS control region using the modified DFSDF member.
2. ### Add New Item to IMS Catalog and Staging Directory - JCL(C9CATUPD) ###
   Specify MANAGEACBS=STAGE in SYSINP DD, and modify the DFS3PU00 parameter to include the relevant PSBNAME and DFSDF member name. Submit the JCL.

   The JCL invokes the DFS3UACB utility to load the resource into the IMS catalog and staging directory data set.
3. ### Activate Newly Added Resource - JCL(C99IMCMD) ###
   Update the JCL to import the PSB definition from staging to active directory, and to create new program resources. Use the following IMS commands:
   ```
   IMPORT DEFN SOURCE(CATALOG) 
   CRE PGM NAME(PORDRMRG) LIKE(RSC(PORDRMRA))
   ```
   Submit the JCL.

   The PSB definition is imported from the IMS catalog to the active directory, and a new resource is created.
4. ### Test ORDRMR Database with Newly Added PSB ###
   To verify functionality, run ORDGET and ORDUPD jobs. For the subsequent runs, change the PSBNAME in the DFSRRC00 parameter to the newly added PSB, and observe the differences in behavior between URDUPD runs.

After you complete these steps, your environment is successfully migrated to IMS-managed ACBs, and functionality has been verified with the newly added PSB.

