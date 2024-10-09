//C2ACBGEN JOB (112270000),'ACBGEN CATALOG',MSGLEVEL=(1,1),             00010006
//         MSGCLASS=R,CLASS=A,NOTIFY=&SYSUID                            00020007
//*------------------------------------------------------------------** 00030000
//* GENERATE ACBS FOR CATALOG DBS                                       00040005
//*------------------------------------------------------------------** 00050000
//CATACB  EXEC PGM=DFSRRC00,PARM='UPB'                                  00060005
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00070001
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00071005
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        00080002
//         DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        00081005
//IMSACB   DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        00082005
//SYSPRINT DD  SYSOUT=*                                                 00090000
//SYSIN    DD  *                                                        00100000
         BUILD PSB=(psbname)                                            00110008
/*    