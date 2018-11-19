public class AccountSearchController {
 
    //added an instance varaible for the standard controller
    private ApexPages.StandardController controller {get; set;}
    // the actual account
    public Account a;
    public Account s;
    pagereference p = null;
    
    public string current_Id {get; set;}    
    public string sid1 {get; set;}
    public string sid2 {get; set;}
            
    public List<Account> searchResults {get;set;}
    public List<QResult> QResultList{get; set;}
      
    public string BillingStreet {
    get {
        if (BillingStreet == null) BillingStreet = ''; // prefill the search box for ease of use
        return BillingStreet;
    }
    set;
    }
    
    public string BillingCity {
    get {
        if (BillingCity == null) BillingCity = ''; // prefill the search box for ease of use
        return BillingCity ;
    }
    set;
    }

    public string BillingPostalCode {
    get {
        if (BillingPostalCode == null) BillingPostalCode = ''; // prefill the search box for ease of use
        return BillingPostalCode ;
    }
    set;
    }    
    
    public string BillingState {
    get {
        if (BillingState == null) BillingState = ''; // prefill the search box for ease of use
        return BillingState;
    }
    set;
    }  
    
//Constructor            
    public AccountSearchController(ApexPages.StandardController controller) {
 
        //initialize the stanrdard controller
        this.controller = controller;
        this.a = (Account)controller.getRecord();
        system.debug('AccountRec: ' +a);
        s=[ SELECT Id,Name,BillingStreet,BillingCity,BillingState,BillingPostalCode FROM Account WHERE Id=:a.Id];
        sid1=a.Id;
        BillingStreet =s.BillingStreet;
        BillingCity=s.BillingState;
        BillingPostalCode=s.BillingPostalCode;
        BillingCity=s.BillingCity;
        BillingState=s.BillingState;
        search();
    }
 
    // fired when the search button is clicked
    public PageReference search()
    {
        if (searchResults == null) {
            searchResults = new List<Account>(); // init the list if it is null
        } else {
            searchResults.clear(); // clear out the current results if they exist
        }
         
     // Use Dynamic SOQL to find the account based on user input
        String qry = 'Select o.Id,o.Name,o.BillingStreet,o.BillingCity,o.BillingState,o.BillingPostalCode from account o Where BillingStreet LIKE \'%'+BillingStreet+'%\' AND BillingCity LIKE \'%'+BillingCity+'%\' AND BillingState LIKE \'%'+BillingState+'%\' AND BillingPostalCode LIKE \'%'+BillingPostalCode+'%\' AND Id!=\''+a.Id+'\' ORDER By o.Name';

        sid1=a.id;
        System.currentPagereference().getParameters().put(sid1,'success');
        searchResults = Database.query(qry);

        if(searchResults==null)
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records Found'));
       return null;
    }
    
     public PageReference amerge()
     {  
         return null;  
     }
    
    public class QResult{        
        public account acc {get; set;}        
        public string  pid  {get; set;}
        public Boolean selected {get; set;}        
        
        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false        
        public QResult(account a) {            
        acc = a;            
        pid='';
        selected = false;        
        }    
    }
}