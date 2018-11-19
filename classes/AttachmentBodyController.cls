public with sharing class AttachmentBodyController {

    public String body {get; set;}
     public String attachmentid {get; set;}
    public Attachment attachment {get; set;}
    public AttachmentBodyController() {
        String Id  = ApexPages.currentPage().getParameters().get('id');
        attachment =  [SELECT Id, Name, Body, ContentType FROM Attachment WHERE Id = :Id];
        attachmentid= attachment.id;
        body = EncodingUtil.base64Encode(attachment.body);
    }
}