//*--------------------------------------------------------------------
//*  IDCAMS - DELETE DATA SETS                                         
//*--------------------------------------------------------------------
//DELDS   EXEC PGM=IDCAMS                                              
//SYSPRINT  DD  SYSOUT=*                                               
//SYSIN     DD  *                                                      
  DELETE WORKSHOP.MACB.C3CATAN.LOG1                                    
  SET MAXCC=0                                                          
//*-------------------------------------------------------------------- 
//* ANALYZE CATALOG                                                     
//*-------------------------------------------------------------------- 
//CATANA  EXEC PGM=DFS3PU00,REGION=7M,                                  
// PARM=(DLI,DFS3PU00,psbname,,,,,,,,,,,Y,N,,,,,,,,,,,,'DFSDF=xxx')     
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//PROCLIB  DD  DSN=IMSSYS15.PROCLIB,DISP=SHR                            
//IMS      DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        
//         DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        
//         DD  DSN=IMSSYS15.DBDLIB,DISP=SHR                             
//         DD  DSN=IMSSYS15.PSBLIB,DISP=SHR                             
//IMSACB01 DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        
//         DD  DSN=IMSSYS15.ACBLIB,DISP=SHR                                                            
//IEFRDER  DD  DSN=WORKSHOP.MACB.C3CATAN.LOG1,DISP=(NEW,CATLG),  
//             SPACE=(CYL,(1,1)),                                
//             UNIT=SYSALLDA                                     
//SYSPRINT DD  SYSOUT=*                                                 
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
//SYSINP   DD  *                                                        
MANAGEDACBS=SETUP                                                       
/* 
