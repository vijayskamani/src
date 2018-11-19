trigger cntrig on Contact (after  insert) {
   Set<Id> aId = new Set<Id>();
    if(Trigger.isInsert){
        for(Contact opp : Trigger.New){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,count_child__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        for(Account a : acc){
            a.count_child__c=con.size();
        }
        update acc;
    }
}