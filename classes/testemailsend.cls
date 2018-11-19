public class testemailsend {
public String selectedTemplateId { public get; public set; }
Public string body{get; set;}
Public string to{get; set;}
Public string addto{get; set;}
Public string cc{get; set;}
Public string bcc{get; set;}
Public string sub{get; set;}
public List<SelectOption> getTemplateFolderOptions() {
   List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('null', ' - Select - '));
    options.add(new SelectOption(UserInfo.getOrganizationId(), 'Unfiled Public'));
   List<Folder> Folders = [Select Id, Name From Folder Where Type = 'Email'];
   for(Folder f:Folders){
            options.add(new SelectOption(f.Id,f.Name));
        }
        
        return options;
}


}