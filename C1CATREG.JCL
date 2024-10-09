//*------------------------------------------------------------------** 
//* REGISTER CATALOG DB TO DBRC                                         
//*------------------------------------------------------------------** 
//DEFCAT  EXEC PGM=DSPURX00                                             
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        
//SYSPRINT DD  SYSOUT=*                                                 
//SYSIN    DD  *                                                        
 INIT.DB DBD(DFSCD000) TYPHALDB SHARELVL(3)                             
 INIT.PART DBD(DFSCD000) PART(DFSCD01) -                                
   DSNPREFX(WORKSHOP.CATALOG.DFSCD000) -                                
   KEYSTRNG('16char keystring')                                         
 INIT.PART DBD(DFSCD000) PART(DFSCP01) -                                
   DSNPREFX(WORKSHOP.CATALOG.DFSCD000) -                                
   KEYSTRNG('16char keystring')                                         
 INIT.DB DBD(DFSCX000) TYPHALDB SHARELVL(3)                             
 INIT.PART DBD(DFSCX000) PART(DFSCX01) -                                
   DSNPREFX(WORKSHOP.CATALOG.DFSCX000)  -                               
   KEYSTRNG(X'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF')                        
/*                    