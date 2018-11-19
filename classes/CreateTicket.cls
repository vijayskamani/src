Global class CreateTicket implements Messaging.inboundEmailHandler{

Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, 
                            Messaging.InboundEnvelope env ) {


Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

String mySubject = email.subject;
String bdy= email.plainTextBody;
Task_Reminder__c tk=new Task_Reminder__c(Description__c=mySubject ,Request_Content__c=bdy);
insert tk;
result.success = true;
return result;
    }   
    
  
    

}