//*------------------------------------------------------------------   
//* Copy IMS Catalog DBDs and PSBs                                      
//*------------------------------------------------------------------   
//COPY     EXEC PGM=IEBCOPY                                             
//SDFSRESL DD DSN=IMSSYS15.SDFSRESL,DISP=SHR                            
//DBDLIB   DD DSN=WORKSHOP.MACB.DBDLIB,DISP=SHR                         
//PSBLIB   DD DSN=WORKSHOP.MACB.PSBLIB,DISP=SHR                         
//SYSPRINT DD SYSOUT=A                                                  
//SYSIN    DD *                                                         
  COPY OUTDD=DBDLIB,INDD=((SDFSRESL,R)),LIST=YES                        
  SELECT MEMBER=(dbdnames)                                              
  COPY OUTDD=PSBLIB,INDD=((SDFSRESL,R)),LIST=YES                        
  SELECT MEMBER=(psbnames)                                              
//*  