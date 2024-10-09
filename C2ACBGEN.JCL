//*------------------------------------------------------------------** 
//* GENERATE ACBS FOR CATALOG DBS                                       
//*------------------------------------------------------------------** 
//CATACB  EXEC PGM=DFSRRC00,PARM='UPB'                                  
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        
//         DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        
//IMSACB   DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        
//SYSPRINT DD  SYSOUT=*                                                 
//SYSIN    DD  *                                                        
         BUILD PSB=(psbname)                                            
/*    