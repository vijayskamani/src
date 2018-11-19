public class EmailTemplateSelector {

     public String selectedTemplateId { public get; public set; }
    public String templateBody { public get; public set; }        
    
    set <string> templatename = new set <string>();
    public List<SelectOption> getTemplateFolderOptions() {

        List<Folder> Folders = [Select Id, Name From Folder Where Type = 'Email'];
        system.debug(Folders.size());
    
        Set<ID> FolderIds = new Set<ID>();
        for(Folder f:Folders){
            FolderIds.add(f.Id);
        } 
        
        system.debug(FolderIds.size());
        List<SelectOption> options = new List<SelectOption>();
        List<EmailTemplate> Templates = [Select Id, Name, IsActive, Folder.Name 
                                            From EmailTemplate 
                                            Where IsActive = true
                                            And Folder.Id IN :FolderIds
                                            AND Folder.Name ='Unfiled Public Email Templates'
                                            ];
        
        System.debug('***Size is***' +Templates.size());
        
        for (EmailTemplate ET : Templates){
            options.add(new SelectOption(ET.Id,ET.Name));
            templatename.add(ET.Name);
            
        }
        return options;
        
        
    }
    
    public void showContent(){
  
         // query the template body based on selected template
         EmailTemplate t = [select Id,body from EmailTemplate where name =: templatename ];
            
         
         // Assign template body to "templateBody" 
         templatebody =t.body;
    }

}