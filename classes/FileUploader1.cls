public class FileUploader1 {

    public String getPdupload() {
        return null;
    }

 public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<PricebookEntry> pdupload;
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        pdupload = new List<PricebookEntry>();
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            PricebookEntry a = new PricebookEntry();
            a.Id = inputvalues[0];
                  
           
          

            pdupload.add(a);
        }
        try{
        insert pdupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<PricebookEntry> getuploadedPricebookEntrys()
    {
        if (pdupload!= NULL)
            if (pdupload.size() > 0)
                return pdupload;
            else
                return null;                    
        else
            return null;
    }            


}