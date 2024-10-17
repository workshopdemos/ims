//*--------------------------------------------------------------------
//*  IDCAMS - DELETE DATA SETS                                         
//*--------------------------------------------------------------------
//DELDS   EXEC PGM=IDCAMS                                              
//SYSPRINT  DD  SYSOUT=*                                               
//SYSIN     DD  *                                                      
  DELETE WORKSHOP.MACB.C9CATUPD.LOG1                                   
  SET MAXCC=0                                                          
//*******************************************************************   
//* DFS3UACB GENERATES ACB MEMBERS IN AN ACB LIBRARY BY CALLING THE     
//* ACB MAINTENANCE UTILITY. IN THE SAME JOB STEP,                      
//* DFS3UACB INSERTS RECORDS IN THE EXISTING IMS CATALOG BY CALLING     
//* THE IMS CATALOG POPULATE UTILITY (DFS3PU00)                         
//*******************************************************************   
//*                                                                     
//ACBCATT EXEC PGM=DFS3UACB,REGION=0M                                   
//*                                                                     
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//PROCLIB  DD  DSN=IMSSYS15.PROCLIB,DISP=SHR                            
//DFSRESLB DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//SYSPRINT DD  SYSOUT=A                                                 
//SYSOUT   DD  SYSOUT=A                                                 
//SYSABEND DD  SYSOUT=*                                                 
//IMS      DD  DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                        
//         DD  DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                        
//ACBCATWK DD  SPACE=(CYL,(1,1)),UNIT=SYSDA                             
//*                                                                     
//*******************************************************************   
//* ACBGEN DATASETS                                                     
//*******************************************************************   
//IMSACB   DD  DSN=WORKSHOP.MACB.ACBLIB,DISP=OLD                        
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(100,100))                          
//SYSUT4   DD  UNIT=SYSDA,SPACE=(256,(100,100)),DCB=KEYLEN=30           
//*******************************************************************   
//* ACBGEN INPUT PARMS TO UPDATE ACBLIB                                 
//*******************************************************************   
//SYSIN    DD  *                                                        
      BUILD PSB=PORDRMRG                                                
/*                                                                             
//IEFRDER  DD  DSN=WORKSHOP.MACB.C9CATUPD.LOG1,DISP=(NEW,CATLG), 
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
//*******************************************************************   
//* POPULATE UTILITY DATASETS                                           
//*******************************************************************   
//IMSACB01 DD  DSN=*.IMSACB,DISP=OLD      DO NOT REPLACE ASTERISK       
//SYSINP   DD  *                                                        
MANAGEDACBS=xxxxx                                                       
//*******************************************************************   
//* UPDATE INPUT PARMS FOR IMS CATALOG POPULATE UTILITY                 
//*******************************************************************   
//DFS3PPRM DD  *                                                        
DLI,DFS3PU00,psbname,,,,,,,,,,,Y,N,,,,,,,,,,,,DFSDF=xxx                 
/*                                                                       
