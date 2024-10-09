//C9CATUPD JOB (127300030),'CATALOG UPDATE',MSGLEVEL=(1,1),             00010018
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020014
//*******************************************************************   00059016
//* DFS3UACB GENERATES ACB MEMBERS IN AN ACB LIBRARY BY CALLING THE     00059116
//* ACB MAINTENANCE UTILITY. IN THE SAME JOB STEP,                      00059216
//* DFS3UACB INSERTS RECORDS IN THE EXISTING IMS CATALOG BY CALLING     00059316
//* THE IMS CATALOG POPULATE UTILITY (DFS3PU00)                         00059416
//*******************************************************************   00059516
//*                                                                     00059616
//ACBCATT EXEC PGM=DFS3UACB,REGION=0M                                   00059716
//*                                                                     00059816
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00059916
//PROCLIB  DD  DSN=IMSSYS15.PROCLIB,DISP=SHR                            00060016
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00060116
//SYSPRINT DD  SYSOUT=A                                                 00060216
//SYSOUT   DD  SYSOUT=A                                                 00060316
//SYSABEND DD  SYSOUT=*                                                 00060416
//IMS      DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        00060516
//         DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        00060616
//ACBCATWK DD  SPACE=(CYL,(1,1)),UNIT=SYSDA                             00060716
//*                                                                     00060816
//*******************************************************************   00060916
//* ACBGEN DATASETS                                                     00061016
//*******************************************************************   00061116
//IMSACB   DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        00061216
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(100,100))                          00061316
//SYSUT4   DD  UNIT=SYSDA,SPACE=(256,(100,100)),DCB=KEYLEN=30           00061416
//*******************************************************************   00061516
//* ACBGEN INPUT PARMS TO UPDATE ACBLIB                                 00061616
//*******************************************************************   00061716
//SYSIN    DD  *                                                        00061816
      BUILD PSB=PORDRMRG                                                00061916
/*                                                                      00062016
//IEFRDER  DD  DSN=IMSSYS15.SLDS,DISP=SHR                               00083014
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
//*******************************************************************   00099519
//* POPULATE UTILITY DATASETS                                           00099619
//*******************************************************************   00099719
//IMSACB01 DD  DSN=*.IMSACB,DISP=OLD      DO NOT REPLACE ASTERISK       00099816
//SYSINP   DD  *                                                        00099909
MANAGEDACBS=xxxxx                                                       00100019
//*******************************************************************   00110016
//* UPDATE INPUT PARMS FOR IMS CATALOG POPULATE UTILITY                 00120016
//*******************************************************************   00130016
//DFS3PPRM DD  *                                                        00140016
DLI,DFS3PU00,psbname,,,,,,,,,,,Y,N,,,,,,,,,,,,DFSDF=xxx                 00150019
/*                                                                      00160016
/*                                                                      00190000
