public class updateprice {
public String selectedPBNId{get;set;}
    public updateprice(ApexPages.StandardController controller) {

    }
    
     public List<SelectOption> getPBname() {
              List<SelectOption> PBN= new List<SelectOption>();
              PBN.add( new SelectOption('','--Select--'));
              for( Pricebook2 pb : [SELECT Id,Name FROM Pricebook2 ] ) {
                      PBN.add( new SelectOption(pb.Id,pb.name)); /*SelectOption list takes two parameters one is value and other one is label .In this case pbount name as a label and Id is the value .*/
              }
             return PBN;
       }    
public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }

  public PageReference upload() {

    attachment.OwnerId = UserInfo.getUserId();
    attachment.ParentId = '0037000000lFxcw'; // the record the file is attached to
    attachment.IsPrivate = true;

    try {
      insert attachment;
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } finally {
      attachment = new Attachment(); 
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }
}