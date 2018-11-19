global class BatchEntitlementUpdate implements Database.Batchable<sObject>{
     Global string Stage ;
    
    
  
// Batch Constructor
    global BatchEntitlementUpdate(String Stage){
        this.Stage = Stage;
       
       
    }
 
   global Database.QueryLocator start(Database.BatchableContext BC){
      String query ='select id,name,Account.Name from Opportunity where Name= :Stage' ;
      return Database.getQueryLocator(query);
   }
  
   global void execute (Database.Batchablecontext BC, list<Opportunity> scope){
     string header = 'ID, NAME , Account \n';
        string finalstr = header ;
       set<id> opid=new set<id>();
       for(Opportunity o:scope){
           opid.add(o.id);
             string recordString = o.ID + ',' + o.Name +','+o.Account.Name+ '\n'; 
              finalstr = finalstr + recordString;
       }
       Blob b = Blob.valueof(finalstr);
               Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('Opportunity_List.csv');
        efa.setBody(b);
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        list<string> emailaddresses = new list<string>{'vijayskamani@gmail.com'};
        email.setSubject( 'Test subject' );
        email.setToAddresses( emailaddresses );
        string body ='Hi'+'\n\n'+'Thanks';
        email.setPlainTextBody( 'Hi ' );
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});  
            }

    global void finish(Database.Batchablecontext BC){
    }
}