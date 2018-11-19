public class sdescription {
    public void my(){
        list<Account> acc=[select id,name,Description,(select id from contacts) from Account];
          list<Contact> con =[select id, lastname,shortDescription__c from contact];
        for(Account a:acc){
            
            
            for(contact c:con){
                string st=a.Description;
                c.Description=st;
                
             }
            update con;
            
        }        
        
    }
       
}