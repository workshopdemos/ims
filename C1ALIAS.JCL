//C1ALIAS  JOB (127300030),'CATALOG ALIAS ',MSGLEVEL=(1,1),             00010005
//         MSGCLASS=R,CLASS=A                                           00020005
//*------------------------------------------------------------------** 00050000
//* CREATE CATALOG ALIAS                                                00070005
//*------------------------------------------------------------------** 00090005
//ALIAS   EXEC PGM=DFS3ALI0                                             00110005
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00120005
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           00130005
//SYSLMOD  DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        00131005
//SYSPRINT DD  SYSOUT=*                                                 00140005
//SYSLIN   DD  UNIT=SYSDA,SPACE=(CYL,(1,1))                             00160005
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(1,1))                             00170005
//SYSIN    DD  *                                                        00180005
alias                                                                   00190005