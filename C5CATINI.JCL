//*------------------------------------------------------------------** 
//* INIT CATALOG DB PARTITION                                           
//*------------------------------------------------------------------** 
//PINIT    EXEC PGM=DFSUPNT0,REGION=2048K                               
//STEPLIB  DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            
//DFSRESLB DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            
//IMS      DD DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                         
//RECON1   DD DSN=IMSSYS15.RECON1,DISP=SHR                              
//RECON2   DD DSN=IMSSYS15.RECON2,DISP=SHR                              
//RECON3   DD DSN=IMSSYS15.RECON3,DISP=SHR                              
//DFSVSAMP DD *                                                         
VSRBF=8192,10                                                           
IOBF=(4096,10)                                                          
//SYSUDUMP DD SYSOUT=A                                                  
//SYSPRINT DD SYSOUT=A                                                  
//SYSIN DD *                                                            
dbdname                                                                 
dbdname                                                                 
/*    