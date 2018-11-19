trigger cnuptrig on Contact (after delete) {
    Set<Id> aId = new Set<Id>();
    if(Trigger.isDelete){
        for(Contact opp : Trigger.old){
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