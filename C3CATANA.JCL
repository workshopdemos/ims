//C3CATAN JOB (127300030),'CATALOG ANALYZ',MSGLEVEL=(1,1),              00010008
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020011
//*-------------------------------------------------------------------- 00056008
//* ANALYZE CATALOG                                                     00057008
//*-------------------------------------------------------------------- 00058008
//CATANA  EXEC PGM=DFS3PU00,REGION=7M,                                  00060008
// PARM=(DLI,DFS3PU00,psbname,,,,,,,,,,,Y,N,,,,,,,,,,,,'DFSDF=xxx')     00061012
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00070001
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00071005
//PROCLIB  DD  DSN=IMSSYS15.PROCLIB,DISP=SHR                            00072008
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        00080002
//         DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        00081005
//         DD  DSN=IMSSYS15.DBDLIB,DISP=SHR                             00081109
//         DD  DSN=IMSSYS15.PSBLIB,DISP=SHR                             00081209
//IMSACB01 DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        00082008
//         DD  DSN=IMSSYS15.ACBLIB,DISP=SHR                             00082109
//IEFRDER  DD  DSN=IMSSYS15.SLDS,DISP=SHR                               00083010
//SYSPRINT DD  SYSOUT=*                                                 00090000
//DFSVSAMP DD  *                                                        00091009
24576,16                                                                00092008
8192,100                                                                00093008
4096,180                                                                00094008
2048,180                                                                00095008
1024,180                                                                00096008
0512,180                                                                00097008
IOBF=(1024,16,N,N)                                                      00098008
IOBF=(2048,16,N,N)                                                      00099008
IOBF=(4096,16,N,N)                                                      00099108
IOBF=(6144,16,N,N)                                                      00099208
IOBF=(8192,16,N,N)                                                      00099308
IOBF=(30720,16,N,N)                                                     00099408
//SYSINP   DD  *                                                        00099509
MANAGEDACBS=SETUP                                                       00100008
/* 