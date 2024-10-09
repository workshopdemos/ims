//C99IMCMD JOB (127300030),'IMS COMMANDS  ',MSGLEVEL=(1,1),             00010021
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020014
//*-------------------------------------------------------------------- 00056008
//* ISSUE IMS COMMANDS                                                  00057019
//*-------------------------------------------------------------------- 00058013
//SPOC      EXEC PGM=CSLUSPOC,                                          00059819
//  PARM=('IMSPLEX=PLEX1,ROUTE=IMSA,WAIT=30,F=WRAP')                    00059919
//*                                                                     00060016
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00060116
//SYSPRINT  DD SYSOUT=*                                                 00060219
//SYSIN     DD *                                                        00060319
ims command per one line                                                00150021
/*                                                                      00160016