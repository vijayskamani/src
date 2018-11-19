public class sendEmail {
    public String subject{get;set;}
    public String body{get;set;}
    public List <String> ToAddresses{get;set;}
    
    public sendEmail() 
    {
        ToAddresses = new List <String>();//[select name ,id,managerid,manager email  form  user where id =:userinfo.getuserId()]
        ToAddresses.add('vijayskamani@gmail.com'); //Add your custom logic to extract email of contact  
    }

    public PageReference send() 
    {
        // Define the email 
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
       /* PageReference pdf =  Page.attachmentPDF;//Replace attachmentPDF with the page u have rendered as PDF
        pdf.getParameters().put('id',(String)account.id); 
        pdf.setRedirect(true);

        // Take the PDF content
        Blob b = pdf.getContent();

        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('Attachement');
        efa.setBody(b);

        // Sets the paramaters of the email 
        */
        email.setSubject( subject );
        email.setToAddresses( ToAddresses );
        email.setPlainTextBody( body );

       // email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa}); // Sends the email 
    
        Messaging.SendEmailResult [] r = 
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
        
        return null;
    }
}