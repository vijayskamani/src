public with sharing class sendemailFromIQController {
public String selectedTemplateId { public get; public set; }
Public string body{get; set;}
Public string to{get; set;}
Public string addto{get; set;}
Public string cc{get; set;}
Public string bcc{get; set;}
Public string sub{get; set;}
public string frm{get; set;}
//Public Inquiry__c iq{get; set;}
    public List<SelectOption> templist {get; set;}
    public List<EmailTemplate> allEmailTemplates;
    public List<Folder> allEmailTemplateFolders;
    public String selectedEmailTemplateFolder {get;set;}
    public String selectedEmailTemplate {get; set;}
    public EmailTemplate chosenEmailTemplate {public get; private set;}

    public sendemailFromIQController() {
       frm=UserInfo.getUserEmail();
       templist = new list<selectOption>();
        allEmailTemplateFolders = [select Id, Name from Folder where Type = 'Email' order by Name asc];
      if(ApexPages.currentPage().getParameters().get('temID') != null){
                              selectedEmailTemplate= ApexPages.currentPage().getParameters().get('temID');
                              system.debug('temID-->'+selectedEmailTemplate);
                             EmailTemplate t=[select Id, Name, Subject, Body, FolderId from EmailTemplate where id=:selectedEmailTemplate limit 1];
                                body=t.body;
                                sub=t.Subject;
                            }
    }

    public List<SelectOption> getEmailTemplateFolderOpts() {
        List<SelectOption> opts = new List<SelectOption>();
        opts.add(new SelectOption('null', ' - Select - '));
        for ( Folder f : allEmailTemplateFolders )
            opts.add(new SelectOption(f.Id, f.Name));
        // add an option for templates in the Unfiled Public folder
        opts.add(new SelectOption(UserInfo.getOrganizationId(), 'Unfiled Public'));
        return opts;
    }

   /* public List<SelectOption> getEmailTemplateOpts() {
        List<SelectOption> opts = new List<SelectOption>();
      
            opts.add(new SelectOption('null', ' - Select - '));
            Id selectedId = (Id) selectedEmailTemplateFolder;
            system.debug('Folder ID-'+selectedId);
            if(selectedId !=null && selectedId !='null'){
                for ( EmailTemplate et : [select Id, Name, Subject, Body, FolderId from EmailTemplate where FolderId=:selectedId  order by Name asc  ] ) {
                
                    opts.add(new SelectOption(et.Id, et.Name));
                } 
            }
           
        
        return opts;
    } */

    public void refreshEmailTemplateSection() {
        system.debug('Action function block');
        system.debug('selectedEmailTemplateFolder--'+selectedEmailTemplateFolder);
        templist.clear();
         templist.add(new SelectOption('null', ' - Select - '));
            if(selectedEmailTemplateFolder !=null ){
                
                for ( EmailTemplate et : [select Id, Name, Subject, Body, FolderId from EmailTemplate where FolderId=:selectedEmailTemplateFolder  order by Name asc  ] ) {
                
                    templist.add(new SelectOption(et.Id, et.Name));
                } 
            }
  
        
    }  
    
    Public void emailbody(){
        if(selectedEmailTemplate!=null){
            EmailTemplate t=[select Id, Name, Subject, Body, FolderId from EmailTemplate where id=:selectedEmailTemplate];
            body=t.body;
            sub=t.Subject;
            System.debug('Body--'+body);
        }
        
    }
     public PageReference reloadthepage() {
           system.debug('selectedEmailTemplate--'+selectedEmailTemplate);
         PageReference pageRef = new PageReference('www.google.com');//'/apex/sendemailFromIQ?temID=' + selectedEmailTemplate
                 //pageRef.setRedirect(true);
                 system.debug('redirect page-->'+selectedEmailTemplate);
                return pageRef;
  }

}