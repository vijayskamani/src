public class SomeController {

public String selectedTemplateId { public get; public set; }
Public string body{get; set;}
Public string to{get; set;}
Public string addto{get; set;}
Public string cc{get; set;}
Public string bcc{get; set;}
Public string sub{get; set;}
    private List<EmailTemplate> allEmailTemplates;
    private List<Folder> allEmailTemplateFolders;
    public String selectedEmailTemplateFolder {public get; public set;}
    public String selectedEmailTemplate {public get; public set;}
    public EmailTemplate chosenEmailTemplate {public get; private set;}

    public SomeController() {
        allEmailTemplates = [select Id, Name, Subject, Body, FolderId from EmailTemplate order by Name asc];
        allEmailTemplateFolders = [select Id, Name from Folder where Type = 'Email' order by Name asc];
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

    public List<SelectOption> getEmailTemplateOpts() {
        List<SelectOption> opts = new List<SelectOption>();
        if ( selectedEmailTemplateFolder != null ) {
            opts.add(new SelectOption('null', ' - Select - '));
            Id selectedId = (Id) selectedEmailTemplateFolder;
            for ( EmailTemplate et : allEmailTemplates ) {
                if ( et.FolderId == selectedId )
                    opts.add(new SelectOption(et.Id, et.Name));
            }
        }
        return opts;
    }

    public PageReference refreshEmailTemplateSection() {
        // this is a bit ugly, but a consequence of not being able to set a SelectOption's value to null
        if ( selectedEmailTemplateFolder == null || selectedEmailTemplateFolder == 'null' ) {
            selectedEmailTemplateFolder = null;
            selectedEmailTemplate = null;
        }
        if ( selectedEmailTemplate == null || selectedEmailTemplate == 'null' ) {
            selectedEmailTemplate = null;
            chosenEmailTemplate = null;
        } else {
            Id selectedId = (Id) selectedEmailTemplate;
            for ( EmailTemplate et : allEmailTemplates ) {
                if ( et.Id == selectedId ) {
                    chosenEmailTemplate = et;
                    break;
                }
            }
        }
        return null;
    }
}