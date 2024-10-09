//*-------------------------------------------------------------------- 
//* ISSUE IMS COMMANDS                                                  
//*-------------------------------------------------------------------- 
//SPOC      EXEC PGM=CSLUSPOC,                                          
//  PARM=('IMSPLEX=PLEX1,ROUTE=IMSA,WAIT=30,F=WRAP')                    
//*                                                                     
//STEPLIB  DD  DSN=IMSSYS15.SDFSRESL,DISP=SHR                           
//SYSPRINT  DD SYSOUT=*                                                 
//SYSIN     DD *                                                        
ims command per one line                                                
/*                                                                      