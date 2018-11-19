public class AccountMergeSearchController {

// -----------------------------------------------------------------------
// public class CategorySearchController {
// copied from Jeff Douglas code
// see http://blog.jeffdouglas.com/2009/01/13/apex-search-with-checkbox-results/

    // the results from the search. do not init the results or a blank rows show up initially on page load
    public List<AmsWrapper> searchResults {get;set;}
    // the categories that were checked/selected.
    public List<AmsWrapper> selectedAccounts {
        get {
            if (selectedAccounts == null) selectedAccounts = new List<AmsWrapper>();
            return selectedAccounts;
        }
        set;
    }      

    // the text in the search box
    public string searchText {
        get {
            if (searchText == null) searchText = 'email'; // prefill the serach box for ease of use
            return searchText;
        }
        set;
    } 

    // constructor
    public AccountMergeSearchController() {}

    // fired when the search button is clicked
    public PageReference search() {

        if (searchResults == null) {
            searchResults = new List<AmsWrapper>(); // init the list if it is null
        } else {
            searchResults.clear(); // clear out the current results if they exist
        }
        // Note: you could have achieved the same results as above by just using:
        // searchResults = new List<AmsWrapper>();

        // dynamic soql for fun
        String qry = 'SELECT a.Name, a.Id, a.CreatedDate ' +
                      'FROM Account a ' +
                      'WHERE a.name LIKE \'%'+searchText+'%\' ' +
                      'ORDER BY a.CreatedDate';
        // may need to modify for governor limits??
        for(Account a : Database.query(qry)) {
            // create a new wrapper by passing it the category in the constructor
            AmsWrapper aw = new AmsWrapper(a);
            // add the wrapper to the results
            searchResults.add(aw);
        }
        return null;
    }   

    public PageReference next() {

        // clear out the currently selected categories
        selectedAccounts.clear();

        // add the selected categories to a new List
        for (AmsWrapper aw : searchResults) {
            if (aw.checked)
                selectedAccounts.add(new AmsWrapper(aw.acct));
        }

        // ensure they selected at least one category or show an error message.
        if (selectedAccounts.size() > 1) {
          //return  null;
            return Page.AmsResultVF;
            // *** My test code HERE ***
          // 1 PageReference pr = New PageReference('/merge/accmergewizard.jsp?' + 'goNext=+Next+' + '&cid=001e000000C1FwE' + '&cid=001e000000CqmcV');
          // 2 pr.getParameters().put('goNext','+Next+');
          // 2 pr.getParameters().put('cid','001200000012346');
          // 2 return pr;
            
        } else {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please select at least TWO Accounts.'));
            return null;
        }       

    }       

    // fired when the back button is clicked
    public PageReference back() {
        //return null;
        return Page.testmerge;
    }       

}