public class accon {
 public void my()
    {  
        list<account> ac=[select id,name ,Description ,(select id,name,shortDescription__c from contacts) from Account];
          system.debug('*****the Account details*****'+ac);
          for(Account acc:ac){
     //                    list<contact> co=[select id,shortDescription__c from contact where id=:acc.id];
             // for (integer a=0;a<ac.size();a++){
   
         for(contact con:acc.contacts){
         string st=acc.Description;
             system.debug(st);
                        con.Description =st;
               update con;
                             }
                                                
                             }
    }
    
     
    }