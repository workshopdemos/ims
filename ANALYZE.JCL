//ANALYZE JOB (127300030),'ANALYZE DB    ',MSGLEVEL=(1,1),              00010012
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020014
//*-------------------------------------------------------------------- 00030008
//* ANALYZE DB                                                          00040012
//*-------------------------------------------------------------------- 00050008
//DBA       EXEC PGM=IDIDBA                                             00051013
//STEPLIB   DD  DISP=SHR,DSN=IMSTOOLS.CIMTLOAD                          00052015
//          DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          00053012
//DFSRESLB  DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          00054012
//IMS       DD  DSN=IMSSYS15.DBDLIB,DISP=SHR                            00055313
//          DD  DSN=IMSSYS15.PSBLIB,DISP=SHR                            00055413
//RECON1    DD  DISP=SHR,DSN=IMSSYS15.RECON1                            00056012
//RECON2    DD  DISP=SHR,DSN=IMSSYS15.RECON2                            00057012
//RECON3    DD  DISP=SHR,DSN=IMSSYS15.RECON3                            00058012
//SYSPRINT  DD  SYSOUT=*                                                00060012
//DBACTRL   DD *                                                        00061012
FUNCTION=ANALYZE,                                                       00062013
DBD=ORDRMR,                                                             00063022
DBRC=Y                                                                  00068013
/*                                                                      00190013