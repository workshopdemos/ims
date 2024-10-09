//C4CATALC JOB (112270000),'CAT ALLOC     ',MSGLEVEL=(1,1),
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID
//*--------------------------------------------------------------------
//*  IDCAMS - DELETE AND DEFINE CATALOG DATA SETS
//*--------------------------------------------------------------------
//DEFDB   EXEC PGM=IDCAMS
//DFSC001A DD  DSN=WORKSHOP.CATALOG.DFSCD000.A00001,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC001B DD  DSN=WORKSHOP.CATALOG.DFSCD000.B00001,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC001C DD  DSN=WORKSHOP.CATALOG.DFSCD000.C00001,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC001D DD  DSN=WORKSHOP.CATALOG.DFSCD000.D00001,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC002A DD  DSN=WORKSHOP.CATALOG.DFSCD000.A00002,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC002B DD  DSN=WORKSHOP.CATALOG.DFSCD000.B00002,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC002C DD  DSN=WORKSHOP.CATALOG.DFSCD000.C00002,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//DFSC002D DD  DSN=WORKSHOP.CATALOG.DFSCD000.D00002,DISP=(NEW,CATLG),
//             SPACE=(CYL,(primary,secondary)),
//             UNIT=SYSALLDA
//SYSPRINT  DD  SYSOUT=*
//SYSIN     DD  *

    /* PRIMARY INDEX DATA SET          */

    DEFINE  CLUSTER ( -
            NAME (WORKSHOP.CATALOG.DFSCD000.X00001) -
            CYL(primary,secondary) -
            REUSE -
            FREESPACE(80,10) -
            SHAREOPTIONS(3,3) -
            SPEED ) -
          DATA ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.X00001.DATA) -
            CISZ(512) -
            KEYS(16,5) -
            RECORDSIZE(22,22) ) -
          INDEX ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.X00001.INDEX) -
            CISZ(2048) )

    DEFINE  CLUSTER ( -
            NAME (WORKSHOP.CATALOG.DFSCD000.X00002) -
            CYL(primary,secondary) -
            REUSE -
            FREESPACE(80,10) -
            SHAREOPTIONS(3,3) -
            SPEED ) -
          DATA ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.X00002.DATA) -
            CISZ(512) -
            KEYS(16,5) -
            RECORDSIZE(22,22) ) -
          INDEX ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.X00002.INDEX) -
            CISZ(2048) )

    /* INDIRECT LIST DATA SET                    */

    DEFINE  CLUSTER ( -
            NAME (WORKSHOP.CATALOG.DFSCD000.L00001) -
            CYL(primary,secondary) -
            REUSE -
            FREESPACE(80,10) -
            SHAREOPTIONS(3,3) -
            SPEED ) -
          DATA ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.L00001.DATA) -
            CISZ(512) -
            KEYS(9,0) -
            RECORDSIZE(50,50) ) -
          INDEX ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.L00001.INDEX) -
            CISZ(2048) )

    DEFINE  CLUSTER ( -
            NAME (WORKSHOP.CATALOG.DFSCD000.L00002) -
            CYL(primary,secondary) -
            REUSE -
            FREESPACE(80,10) -
            SHAREOPTIONS(3,3) -
            SPEED ) -
          DATA ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.L00002.DATA) -
            CISZ(512) -
            KEYS(9,0) -
            RECORDSIZE(50,50) ) -
          INDEX ( -
            NAME(WORKSHOP.CATALOG.DFSCD000.L00002.INDEX) -
            CISZ(2048) )

    /* SECONDARY INDEX DATA SET                */

    DEFINE  CLUSTER ( -
            NAME(WORKSHOP.CATALOG.DFSCX000.A00001) -
            CYL(primary,secondary) -
            REUSE -
            INDEXED -
            KEYS(37,45) -
            RECORDSIZE(82,82) -
            FREESPACE(80,10) -
            SHAREOPTIONS(3,3) -
            SPEED ) -
          DATA (CISZ(4096) )