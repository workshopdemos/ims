//C7VERIFY JOB 112470000,'WTOXP',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID,     00010021
//            REGION=0M                                                 00020020
//*-------------------------------------------------------------------- 00030008
//* VERIFY IMS CATALOG, IMS DIRECTORY AND ACBLIB                        00040020
//*-------------------------------------------------------------------- 00050008
//VERIFY EXEC PGM=ITKCATLG                                              00050114
//STEPLIB  DD DSN=IMSTOOLS.CIMTPLD,DISP=SHR                             00050216
//         DD DSN=IMSTOOLS.CIMTLOAD,DISP=SHR                            00050316
//         DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            00050417
//DFSRESLB DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            00050517
//PROCLIB  DD DSN=IMSSYS15.PROCLIB,DISP=SHR                             00050614
//SYSPRINT DD SYSOUT=*                                                  00050714
//DFSVSAMP DD  *                                                        00050818
24576,16                                                                00050918
8192,100                                                                00051018
4096,180                                                                00051118
2048,180                                                                00051218
1024,180                                                                00051318
0512,180                                                                00051418
IOBF=(1024,16,N,N)                                                      00051518
IOBF=(2048,16,N,N)                                                      00051618
IOBF=(4096,16,N,N)                                                      00051718
IOBF=(6144,16,N,N)                                                      00051818
IOBF=(8192,16,N,N)                                                      00051918
IOBF=(30720,16,N,N)                                                     00052018
//CATCTRL  DD *                                                         00052114
FUNCTION=VALIDATE,                                                      00052214
INPUT1=(DIRECTORY,BSDSHLQ=WORKSHOP.CATALOG.DFSCD000),                   00052314
INPUT2=(CATALOG,DFSDF=xxx),                                             00052421
INPUT3=(ACBLIB,ACBLIBNAME=IMSSYS15.ACBLIB),                             00052515
DBDNAME=dbdname                                                         00053021
/*      