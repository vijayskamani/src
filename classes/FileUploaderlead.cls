public class FileUploaderlead
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<lead> accstoupload;
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<lead>();
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            lead a = new lead();
            a.lastName = inputvalues[0];
            a.company = inputvalues[1];       
            a.street = inputvalues[2];       
            a.City = inputvalues[3];
            a.State = inputvalues[4];
            a.PostalCode = inputvalues[5];
            a.Country = inputvalues[6];

            accstoupload.add(a);
        }
        try{
        insert accstoupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<lead> getuploadedAccounts()
    {
        if (accstoupload!= NULL)
            if (accstoupload.size() > 0)
                return accstoupload;
            else
                return null;                    
        else
            return null;
    }            
}