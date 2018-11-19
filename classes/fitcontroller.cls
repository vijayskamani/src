public class fitcontroller {
public list<Fitness__c> fl{get; set;}
    public fitcontroller(ApexPages.StandardController controller) {
           fl=new list<Fitness__c>();
    }

}