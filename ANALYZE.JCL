//*-------------------------------------------------------------------- 
//* ANALYZE DB                                                          
//*-------------------------------------------------------------------- 
//DBA       EXEC PGM=IDIDBA                                             
//STEPLIB   DD  DISP=SHR,DSN=IMSTOOLS.CIMTLOAD                          
//          DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          
//DFSRESLB  DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          
//IMS       DD  DSN=IMSSYS15.DBDLIB,DISP=SHR                            
//          DD  DSN=IMSSYS15.PSBLIB,DISP=SHR                            
//RECON1    DD  DISP=SHR,DSN=IMSSYS15.RECON1                            
//RECON2    DD  DISP=SHR,DSN=IMSSYS15.RECON2                            
//RECON3    DD  DISP=SHR,DSN=IMSSYS15.RECON3                            
//SYSPRINT  DD  SYSOUT=*                                                
//DBACTRL   DD *                                                        
FUNCTION=ANALYZE,                                                       
DBD=ORDRMR,                                                             
DBRC=Y                                                                  
/*                                                                      