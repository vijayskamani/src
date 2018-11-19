public class AccountEditController {
private final Account acct;
private ApexPages.StandardController stdController;

public AccountEditController(ApexPages.StandardController stdController) { 
this.acct = (Account)stdController.getRecord(); 
this.stdController = stdController;
} 

public PageReference save() { 
// Put my own stuff here

// Do the standard save action  
return this.stdController.save(); 
}
}