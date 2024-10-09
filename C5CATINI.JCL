//C5CATINI JOB (127300030),'INIT DB LOAD  ',MSGLEVEL=(1,1),             00010008
//         MSGCLASS=R,CLASS=A                                           00020007
//*                                                                     00040007
//*------------------------------------------------------------------** 00050007
//* INIT CATALOG DB PARTITION                                           00070007
//*------------------------------------------------------------------** 00090007
//*                                                                     00100007
//PINIT    EXEC PGM=DFSUPNT0,REGION=2048K                               00110007
//STEPLIB  DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            00120007
//DFSRESLB DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            00130007
//IMS      DD DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                         00140007
//RECON1   DD DSN=IMSSYS15.RECON1,DISP=SHR                              00150007
//RECON2   DD DSN=IMSSYS15.RECON2,DISP=SHR                              00160007
//RECON3   DD DSN=IMSSYS15.RECON3,DISP=SHR                              00170007
//DFSVSAMP DD *                                                         00180007
VSRBF=8192,10                                                           00181007
IOBF=(4096,10)                                                          00182007
//SYSUDUMP DD SYSOUT=A                                                  00183007
//SYSPRINT DD SYSOUT=A                                                  00184007
//SYSIN DD *                                                            00185007
dbdname                                                                 00186008
dbdname                                                                 00187008
/*    