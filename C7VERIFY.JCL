//*-------------------------------------------------------------------- 
//* VERIFY IMS CATALOG, IMS DIRECTORY AND ACBLIB                        
//*-------------------------------------------------------------------- 
//VERIFY EXEC PGM=ITKCATLG                                              
//STEPLIB  DD DSN=IMSTOOLS.CIMTPLD,DISP=SHR                             
//         DD DSN=IMSTOOLS.CIMTLOAD,DISP=SHR                            
//         DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            
//DFSRESLB DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            
//PROCLIB  DD DSN=IMSSYS15.PROCLIB,DISP=SHR                             
//SYSPRINT DD SYSOUT=*                                                  
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
//CATCTRL  DD *                                                         
FUNCTION=VALIDATE,                                                      
INPUT1=(DIRECTORY,BSDSHLQ=WORKSHOP.CATALOG.DFSCD000),                   
INPUT2=(CATALOG,DFSDF=xxx),                                             
INPUT3=(ACBLIB,ACBLIBNAME=IMSSYS15.ACBLIB),                             
DBDNAME=dbdname                                                         
/*      