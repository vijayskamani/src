public class AccountContactsListExample {

private ApexPages.StandardController std;
    
    public String message{get;set;}
    
    // the associated contacts
   public List<Contact> contacts {get; set;}
   
    public AccountContactsListExample(ApexPages.StandardController stdCtrl)
    {
     std=stdCtrl;
     contacts=[select id, FirstName, LastName, Email from Contact where accountid=:std.getId() order by firstname asc limit 5];
    }

    public PageReference save()
    {
     // first save the account
     std.save();
     
     // then save the contacts
     update contacts;
     
     PageReference result=ApexPages.currentPage();
     result.setRedirect(true);
     
     return result;
    }
}