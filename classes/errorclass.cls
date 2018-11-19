public class errorclass {
    public void my()
    {
        list<employee__c> emc=[select first_name__c from employee__c];
        system.debug(emc);
    }

}