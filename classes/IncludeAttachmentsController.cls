public class IncludeAttachmentsController {
 public Id soId {get;set;}
    public List<Attachment> attachments {
    get {
            return [select 
                         name
                       , contentType
                       , body 
                    from Attachment 
                    where parentId = :this.soId 
                    order by CreatedDate desc
                    limit 1];}
   
    set;}
    
     Public IncludeAttachmentsController(){}
}