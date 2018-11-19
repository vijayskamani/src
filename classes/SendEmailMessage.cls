public class SendEmailMessage {

    public String toEmail {get;set;}
    public String subject {get;set;}
    public String body {get;set;}
    
    
    private final opportunity myopp;
    public SendEmailMessage(ApexPages.StandardController controller)
    
   
    {
        this.myopp=(opportunity)controller.getRecord();
    } 
   
             
    public void sendEmail() {
        
        //create a mail object to send email 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toaddress = (new String[]{toEmail});
        
        //email properties
        mail.setToAddresses(toaddress);
        mail.setSubject(subject);
        mail.setUseSignature(true);
        mail.setPlainTextBody(body); 
               
        // send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
     }   
   }