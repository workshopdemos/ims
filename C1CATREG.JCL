//C1CATREG JOB (127300030),'DBRC REGISTR  ',MSGLEVEL=(1,1),             00010003
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020007
//*------------------------------------------------------------------** 00030000
//* REGISTER CATALOG DB TO DBRC                                         00040000
//*------------------------------------------------------------------** 00050000
//DEFCAT  EXEC PGM=DSPURX00                                             00060000
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00070001
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        00080002
//SYSPRINT DD  SYSOUT=*                                                 00090000
//SYSIN    DD  *                                                        00100000
 INIT.DB DBD(DFSCD000) TYPHALDB SHARELVL(3)                             00110002
 INIT.PART DBD(DFSCD000) PART(DFSCD01) -                                00120002
   DSNPREFX(WORKSHOP.CATALOG.DFSCD000) -                                00130002
   KEYSTRNG('16char keystring')                                         00140008
 INIT.PART DBD(DFSCD000) PART(DFSCP01) -                                00141005
   DSNPREFX(WORKSHOP.CATALOG.DFSCD000) -                                00142005
   KEYSTRNG('16char keystring')                                         00143008
 INIT.DB DBD(DFSCX000) TYPHALDB SHARELVL(3)                             00150002
 INIT.PART DBD(DFSCX000) PART(DFSCX01) -                                00160002
   DSNPREFX(WORKSHOP.CATALOG.DFSCX000)  -                               00170002
   KEYSTRNG(X'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF')                        00180000
/*                    

