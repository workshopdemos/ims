//C8ICOPY JOB (127300030),'IMAGE COPY    ',MSGLEVEL=(1,1),              00010012
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020014
//*-------------------------------------------------------------------- 00030008
//* CREATE IC                                                           00040012
//*-------------------------------------------------------------------- 00050008
//DBOIC    EXEC PGM=IDIDBO,REGION=0M                                    00051013
//STEPLIB   DD  DISP=SHR,DSN=IMSTOOLS.CIMTLOAD                          00052015
//          DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          00053012
//DFSRESLB  DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          00054012
//PROCLIB   DD  DISP=SHR,DSN=IMSSYS15.PROCLIB                           00055113
//RECON1    DD  DISP=SHR,DSN=IMSSYS15.RECON1                            00056012
//RECON2    DD  DISP=SHR,DSN=IMSSYS15.RECON2                            00057012
//RECON3    DD  DISP=SHR,DSN=IMSSYS15.RECON3                            00058012
//SYSPRINT  DD  SYSOUT=*                                                00060012
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
IOBF=(30720,16,N,N)
//DBOCTRL   DD *                                                        00061012
FUNCTION=COPY,                                                          00062013
DBD=dbdname,                                                            00063013
ICALLOC=Y,ICUNIT=(SYSDA,1),ICSPACE=(C,1,1),                             00064013
ICPREF=WORKSHOP.MACB.IC,                                                00065013
ICCATF=Y,                                                               00066013
DETAILREPORT=Y,                                                         00067013
DFSDF=xxx,
DBRC=Y                                                                  00068013
                                                                        00068113
FUNCTION=COPY,                                                          00069013
DBD=dbdname,                                                            00070013
ICALLOC=Y,ICUNIT=(SYSDA,1),ICSPACE=(C,1,1),                             00080013
ICPREF=WORKSHOP.MACB.IC,                                                00090013
ICCATF=Y,                                                               00100013
DETAILREPORT=Y,                                                         00110013
DFSDF=xxx,
DBRC=Y                                                                  00120013
/*    