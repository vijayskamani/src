public with sharing class AccountDataController {
  //constructor
  public AccountDataController() {
  }

  //list of accounts
  public List<Account> accounts {
    get {
      if(accounts != null) {
        return accounts;
      } else {
        accounts = [Select Id, name,  Description from Account ];
        return accounts;
      }
    }
    set;
  }
}