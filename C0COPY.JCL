//C0COPY    JOB (127300030),'IMS LIST RECON',REGION=0M,                 00010007
//             CLASS=A,MSGCLASS=A,NOTIFY=&SYSUID                        00020000
//*------------------------------------------------------------------   00030000
//* Copy IMS Catalog DBDs and PSBs                                      00040005
//*------------------------------------------------------------------   00041001
//COPY     EXEC PGM=IEBCOPY                                             00042005
//SDFSRESL DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            00043005
//DBDLIB   DD DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                         00044005
//PSBLIB   DD DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                         00045005
//SYSPRINT DD SYSOUT=A                                                  00046006
//SYSIN    DD *                                                         00048006
  COPY OUTDD=DBDLIB,INDD=((SDFSRESL,R)),LIST=YES                        00050005
  SELECT MEMBER=(dbdnames)                                              00060008
  COPY OUTDD=PSBLIB,INDD=((SDFSRESL,R)),LIST=YES                        00070005
  SELECT MEMBER=(psbnames)                                              00080008
//*  