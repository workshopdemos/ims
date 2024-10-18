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
   - To display active IMS systems, type `IMSLIST` in the **Option** field and press **Enter**. The list of IMS control regions appears.
   - For a list of jobs, type `ST` in the **Option** field and press **Enter**. The list of jobs and their status appears. Use the following commands to filter results. You can combine these commands to generate specific job lists.
      -  `PRE IMSA*` - Lists all jobs starting with jobname IMSA* for the current owner.
      -  `OWNER *  ` - Lists jobs for all owners.
3. Use one of the following methods to see which databases are available:
   - **Use IMS DISPLAY Command**
     - Type `L` in the **Cmd** field next to the IMSACTLR job and press **Enter**. The list of job data sets appears.
     - Type `S` next to the JESMSGLG DDname and press **Enter**. The job output appears
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
     - Select **Command** option on the **ISPF Primary Option Menu** and press Enter. The **ISPF Command Shell** appears.
     - Execute the following TSO command:
       ```
       exec 'imssys15.sdfsexec(dfsspsrt)' 'hlq(imssys15)'
       ```
       The **IMS Single Point of Control** panel appears.
     - Enter the following IMS type-2 QUERY command in the **Command** field and specify the IMSplex in the **Plex** field.
       ```
       qry db name(ordrmr) show(all) 
       ```
       Press **Enter**. A list of all defined databases in the system appears.

You have verified that the IMS system is up and running. You can now proceed with the analysis of the test database.
 

