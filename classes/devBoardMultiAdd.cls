public with sharing class devBoardMultiAdd {
public list<Account> accounts{get;set;}


public devBoardMultiAdd(ApexPages.StandardController stdController){
accounts = new list<Account>();
accounts.add(new Account(Name=''));

    
}

public pageReference addFields(){
    
    accounts.add(new Account(Name=''));
    
    return null;
}



public pageReference saveAccs(){
    insert(accounts);
    return null;
}




}