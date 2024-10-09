//*------------------------------------------------------------------** 
//* CREATE CATALOG ALIAS                                                
//*------------------------------------------------------------------** 
//ALIAS   EXEC PGM=DFS3ALI0                                             
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//SYSLMOD  DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        
//SYSPRINT DD  SYSOUT=*                                                 
//SYSLIN   DD  UNIT=SYSDA,SPACE=(CYL,(1,1))                             
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(1,1))                             
//SYSIN    DD  *                                                        
alias                                                                   
//*
