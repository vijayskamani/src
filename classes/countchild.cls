public class countchild {
    public void my(){
        integer i=0;
        list<account> acc=[select id,name,(select id,lastname from contacts)from account];
        for(account a:acc){ 
            for(contact con:a.contacts){
                a.count_child__c=[select count() from contact where Account.name=:a.Name ];            
            }
            system.debug(a.count_child__c);
            update a;
            system.debug('**********'+a.count_child__c);
        }
  }
}