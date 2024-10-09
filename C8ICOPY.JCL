//*-------------------------------------------------------------------- 
//* CREATE IC                                                           
//*-------------------------------------------------------------------- 
//DBOIC    EXEC PGM=IDIDBO,REGION=0M                                    
//STEPLIB   DD  DISP=SHR,DSN=IMSTOOLS.CIMTLOAD                          
//          DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          
//DFSRESLB  DD  DISP=SHR,DSN=IMSSYS15.SDFSRESL                          
//PROCLIB   DD  DISP=SHR,DSN=IMSSYS15.PROCLIB                           
//RECON1    DD  DISP=SHR,DSN=IMSSYS15.RECON1                            
//RECON2    DD  DISP=SHR,DSN=IMSSYS15.RECON2                            
//RECON3    DD  DISP=SHR,DSN=IMSSYS15.RECON3                            
//SYSPRINT  DD  SYSOUT=*                                                
//DFSVSAMP DD  *                                                        
24576,16                                                                
8192,100                                                                
4096,180                                                                
2048,180                                                                
1024,180                                                                
0512,180                                                                
IOBF=(1024,16,N,N)                                                      
IOBF=(2048,16,N,N)                                                      
IOBF=(4096,16,N,N)                                                      
IOBF=(6144,16,N,N)                                                      
IOBF=(8192,16,N,N)                                                      
IOBF=(30720,16,N,N)
//DBOCTRL   DD *                                                        
FUNCTION=COPY,                                                          
DBD=dbdname,                                                            
ICALLOC=Y,ICUNIT=(SYSDA,1),ICSPACE=(C,1,1),                             
ICPREF=WORKSHOP.MACB.IC,                                                
ICCATF=Y,                                                               
DETAILREPORT=Y,                                                         
DFSDF=xxx,
DBRC=Y                                                                  
                                                                        
FUNCTION=COPY,                                                          
DBD=dbdname,                                                            
ICALLOC=Y,ICUNIT=(SYSDA,1),ICSPACE=(C,1,1),                             
ICPREF=WORKSHOP.MACB.IC,                                                
ICCATF=Y,                                                               
DETAILREPORT=Y,                                                         
DFSDF=xxx,
DBRC=Y                                                                  
/*    